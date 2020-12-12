#macro _SALT	("gmisreal2401")

/// @function	authenticate_ownership()
/// @desc		ensures ownership of decomp repo + rom
///				[!] @TODO this function will need to be modified if custom ROMs *EVENTUALLY* can be loaded
function authenticate_ownership() {
	
	globalvar SALT;
	
	ROM_DIR = base64_decode(ROM_DIR);
	
	// force single trailing slash
	while(string_char_at(ROM_DIR, string_length(ROM_DIR)) == "/")
		ROM_DIR = string_delete(ROM_DIR, string_length(ROM_DIR), 1);
	ROM_DIR += "/";
	
	// check for dir
	if (!directory_exists(ROM_DIR)) {
		throw(
			"\ninvalid rom dir, " + string(ROM_DIR) +
			", is File System Sandbox disabled?" +
			"Is the directory string formatted correctly?"
		);	
	}
	
	// check for baserom
	var baserom = ROM_DIR + "/baserom.us.z64";
	if (!file_exists(baserom)) throw("\ncannot locate baserom in rom dir");
	
	// get hash of baserom
	var rom_hash = md5_file(baserom)
	
	SALT = rom_hash + _SALT;
	
	boot("ownership authenticated");
	
}

/// @function	parse_sm64_h()
/// @desc		pull values from /include/sm64.h to verify ownership
function parse_sm64_h() {
	
	boot("attempting to parse sm64.h for ACT masks");
	
	var link_list = [
"wolywpou",
"wpNiwpc5w6lYw4jCv0zDnQZUBsOl",
"wpN6wpMuw60/w5XCtA==",
"wpd3wp0iw7MxwrXCplk=",
"wpB3wpg/w7Q4w5w=",
"wogGwpovwpMmw5rCvV3DkRhaZsO3dMOtQMORw5I=",
"wogGwpovwpM/w5/Cv0w=",
"wogGwpovwpM+w57Csl/DgXhUDMOufw==",
"wpNiwpclw7k/w5XCtCfDmRFcAcOsacOsPcODw5fCncKC",
"woMGwoMsw7U/w5XCtA==",
"wpN+wp89w7gkw5LCvU4=",
"wol4w7g6w6g/w5jCuFrDmRhZ",
"woNkw6Y+w74+w5LCvU4=",
"wpNiwpc5w6lYw5jCoTnDjRVVAcOsfQ==",
"wpNiw6Y7wpM1w4nDg1zDmx5UBsOl",
"wpNiwpc5w6lYw5jCoUjDjxpUBsOl",
"wpNiw6Y7wpM1w4nCsl7DlB9TDw==",
"wpN6wp8vw7hYw5DCukrDk3hOBMOrfsO9PcOHw4LDocKe",
"wpN+w6Yow7Yhw5rCpUzCthQtHcOsecO9",
"woZ/woQ4w6lYw4vCtlvDi2ZT",
"woJ3wpUgw7s6w5LCoyfDlBdTDMKMacOsI8OE",
"wopjwps7wpM6w5rCvU3CtgVJeMOy",
"woQGwoMpw7EzwrXCuVzDlQYzBMOjdMO8PcOHw4LDocKe",
"woZkwpMuw7s3w5fCvyfDlBdTDMKMacOsI8OE",
"wpN/wpIuwpMww5fCulnCthpcBsOmFMOrR8Kkw4Y=",
"wogGwpovwpM8w47CvlnCthpcBsOmFMOrR8Kkw4Y=",
"wogGwpovwpMww4nCtkzDnhdRBMKMdsO5XcOQwrjCgsKaw49c",
"woF/woRFw6k+w4nDg17CthpcBsOm",
"wpRhwp85w7FYw5fCskfDnA==",
"wox3woAqwpM0wqvDg1rDjHhRCcOsfg==",
"wpRkwp87w7EzwrXCuVzDlQYzBMOjdMO8PcOHw4LDocKe",
"wowGwpgswpM8w47CvlnCthpcBsOmFMOrR8Kkw4Y=",
"wodkw6Y+w7MywrXCoznDjRhZZsOue8O2Vw==",
"woJkwpcgw7Q4w5zDnVrDjGY=",
"woJjwoI/wpMlw5fCuk3DnXhOHMKSag==",
"wogGwpovwpM0w47Cp13CtgVRAcOmf8KWQMOAwqbCgQ==",
	];
	
	var file = file_text_open_read(ROM_DIR + "include/sm64.h");
	
	var prefix = "#define ACT_";
	var counts = array_length(link_list);
	
	/* // Encrypt
	for(var i = 0; i < counts; i++) {
		log("\"" + string(base64_encode(rc4(link_list[i], SALT))) + "\",");
		
	}//*/
	
	//* // Decrypt
	for(var i = 0; i < counts; i++) {
		link_list[i] = rc4(base64_decode(link_list[i]), SALT);
	}//*/
	
	
	globalvar AUTH_ACT_FLAGS;
	AUTH_ACT_FLAGS = array_create(counts, null);
	
	for(var i = 0; i < counts; i++) {
		link_list[i] = string_replace_all(link_list[i], "0", "O");	
		link_list[i] = string_replace_all(link_list[i], ".", "_");	
	}
	
	var all_found = 0;
	while(!file_text_eof(file)) {
		var line = file_text_readln(file);
		
		for(var i = 0; i < counts; i++) {
			if (AUTH_ACT_FLAGS[i] != null) continue;
			var pos = string_pos(prefix + link_list[i], line);
			if (pos != 1) continue;
			AUTH_ACT_FLAGS[i] = real(string_copy(line, string_pos("0x", line), 10));
			all_found++;
			
		}
		
		if (all_found>=counts) break;
	}
	file_text_close(file);
	
	boot("parsed sm64.h");
}

/// rc4(str,key)
//
//  Returns the given string encrypted/decrypted with the RC4 algorithm
//  using the given key. RC4 is a trademark of RSA Data Security, Inc.
//
//      str         plaintext or ciphertext, string
//      key         encryption key, string
//
/// GMLscripts.com/license
function rc4() {
    var str, key, out, len, i, S, j, temp, pos, t;
    str = argument0;
    key = argument1;
    out = "";
    len = string_length(key);
    for (i=0; i<256; i+=1) S[i] = i;
    j = 0;
    for (i=0; i<256; i+=1) {
        j = (j + S[i] + ord(string_char_at(key,(i mod len)+1))) mod 256;
        temp = S[i];
        S[i] = S[j];
        S[j] = temp;
    }
    i = 0;
    j = 0;
    for (pos=0; pos<string_length(str); pos+=1) {
        i = (i + 1) mod 256;
        j = (j + S[i]) mod 256;
        temp = S[i];
        S[i] = S[j];
        S[j] = temp;
        t = (S[i] + S[j]) mod 256;
        out += chr(ord(string_char_at(str,pos+1)) ^ S[t]);
    }
    return out;
}