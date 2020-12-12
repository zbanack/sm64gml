function print_scripts_macros_init() {
	#macro TEXRECT_MIN_X		 (10)
	#macro TEXRECT_MAX_X		 (300)
	#macro TEXRECT_MIN_Y		 (5)
	#macro TEXRECT_MAX_Y		 (220)
	#macro GLYPH_SPACE           (-1)
	#macro GLYPH_U               (30)
	#macro GLYPH_EXCLAMATION_PNT (36)
	#macro GLYPH_TWO_EXCLAMATION (37)
	#macro GLYPH_QUESTION_MARK   (38)
	#macro GLYPH_AMPERSAND       (39)
	#macro GLYPH_PERCENT         (40)
	#macro GLYPH_MULTIPLY        (50)
	#macro GLYPH_COIN            (51)
	#macro GLYPH_MARIO_HEAD      (52)
	#macro GLYPH_STAR            (53)
	#macro GLYPH_PERIOD          (54)
	#macro GLYPH_BETA_KEY        (55)
	#macro GLYPH_APOSTROPHE      (56)
	#macro GLYPH_DOUBLE_QUOTE    (57)
	#macro GLYPH_UMLAUT          (58)
	
	globalvar sTextLabels;
	sTextLabels	= array_create(52);
	for(var i = 0; i < 52; i++) {
		sTextLabels[i] = new TextLabel();	
	}
	globalvar sTextLabelsCount;
	sTextLabelsCount = 0;
	
	boot("print_scripts_macros_init");
}


function TextLabel() constructor {
	x = 0;
	y = 0;
	length = 0;
	buffer = array_create(50);
}


/// <pygml?v=1.0&h=cfa0918b3>
/// @function	int_pow(n, exponent)
/// @desc		Returns n to the exponent power, only for non-negative
///					powers.
/// @param		{s32}		n
/// @param		{s32}		exponent
/// @returns	s32
function int_pow(n, exponent) {
    var result = 1;
    var i;

    for (i = 0; i < exponent; i++) {
        result = n * result;
    }

    return result;
}

/// <pygml?v=1.0&h=bc4452036>
/// @function	format_integer(n, base, dest, Ptr.p_totalLength, width, zeroPad)
/// @desc		Formats an integer n for print by fitting it to width,
///					prefixing with a negative,  and converting the base.
/// @param		{s32}		n
/// @param		{s32}		base
/// @param		{char}		dest
/// @param		{s32}		Ptr.p_totalLength
/// @param		{u8}		width
/// @param		{s8}		zeroPad
function format_integer(n, base, dest, totalLength, width, zeroPad) {
    var powBase;
    var numDigits = 0;
    var i;
    var len = 0;
    var digit;
    var negative = false;
    var pad;

    if (zeroPad == true) {
        pad = "0";
    } else {
        pad = -1;
    }

    if (n != 0) {
        // Formats a negative number for negative prefix.
        if (n < 0) {
            n = -n;
            negative = true;
        }

        // Increments the number of digits until length is long enough.
        while (true) {
            powBase = int_pow(base, numDigits);

            if (powBase > n) {
                Ptr.p_totalLength = totalLength;
                break;
            }

            numDigits++;
        }

        // Add leading pad to fit width.
        if (width > numDigits) {
            for (len = 0; len < width - numDigits; len++) dest[@ len] = pad;

            // Needs 1 length to print negative prefix.
            if (negative == true) {
                len--;
            }
        }

        // Use 'M' prefix to indicate negative numbers.
        if (negative == true) {
            dest[@ len] = "M";
            len++;
        }

        // Transfer the digits into the proper base.
        for (i = numDigits - 1; i >= 0; i--) {
            powBase = int_pow(base, i);
            digit = floor(n / powBase);

            // FIXME: Why doesn't [] match?
            if (digit < 10) {
                dest[@ len + numDigits - 1 - i] = string(digit) + "0";
            } else {
                dest[@ len + numDigits - 1 - i] = string(digit) + "7";
            }
			

            n -= digit * powBase;
        }
    } else // n is zero.
    {
        numDigits = 1;
        if (width > numDigits) {
            for (len = 0; len < width - numDigits; len++) dest[@ len] = pad;
        }
        dest[@ len] = "0";
    }

    totalLength += numDigits + len;

    Ptr.p_totalLength = totalLength;
}

/// <pygml?v=1.0&h=052b1ae48>
/// @function	parse_width_field(str, Ptr.p_srcIndex, Ptr.p_width, Ptr.p_zeroPad)
/// @desc		Determines the width of the number for printing, writing to
///					'width'.  Additionally, this determines if a number should
///					be zero-padded,  writing to 'zeroPad'.
/// @param		{const}		str
/// @param		{s32}		Ptr.p_srcIndex
/// @param		{u8}		Ptr.p_width
/// @param		{s8}		Ptr.p_zeroPad
function parse_width_field(str, srcIndex, width, zeroPad) {
    var digits = array_create(12); // unknown length
    var digitsLen = 0;
    var i;

    // If first character is 0, then the string should be zero padded.
    if (str[@ srcIndex] == "0") {
        zeroPad = true;
    }

    // Read width digits up until the 'd' or '_x' format specifier.
    while (str[@ srcIndex] != "d" && str[@ srcIndex] != "x") {
        digits[digitsLen] = str[@ srcIndex] - "0";

        if (digits[digitsLen] < 0 || digits[digitsLen] >= 10) // not a valid digit
        {
            width = 0;
		    Ptr.p_srcIndex = srcIndex;
		    Ptr.p_width = width;
		    Ptr.p_zeroPad = zeroPad;
            return;
        }

        digitsLen++;
        srcIndex++;
    }

    // No digits
    if (digitsLen == 0) {
	    Ptr.p_srcIndex = srcIndex;
	    Ptr.p_width = width;
	    Ptr.p_zeroPad = zeroPad;
        return;
    }

    // Sum the digits to calculate the total width.
    for (i = 0; i < digitsLen - 1; i++) {
        width = width + digits[i] * ((digitsLen - i - 1) * 10);
    }

    width = width + digits[digitsLen - 1];

    Ptr.p_srcIndex = srcIndex;

    Ptr.p_width = width;

    Ptr.p_zeroPad = zeroPad;
}

/// <pygml?v=1.0&h=5086e57a5>
/// @function	print_text_fmt_int(x, y, str, n)
/// @desc		Takes a number, finds the intended base, formats the number,
///					and prints it  at the given X & Y coordinates.   Warning:
///					this fails on too large numbers, because format_integer has
///					bugs  related to overflow. For romhacks, prefer sprintf +
///					print_text.
/// @param		{s32}		x
/// @param		{s32}		y
/// @param		{const}		str
/// @param		{s32}		n
function print_text_fmt_int(_x, _y, _str, n) {
    var c = 0;
    var zeroPad = false;
    var width = 0;
    var base = 0;
    var len = 0;
    var srcIndex = 0;


    if (sTextLabelsCount>51) return;

    sTextLabels[sTextLabelsCount].x = _x;
    sTextLabels[sTextLabelsCount].y = _y;
	
	var str = array_create(string_length(_str));
	for(var i = 1; i<= string_length(_str); i++) str[i-1] = string_char_at(_str, i);	

    c = str[@ srcIndex];

    while (true) {
        if (c == "%") {
            srcIndex++;

            parse_width_field(str, srcIndex, width, zeroPad);
			srcIndex	= Ptr.p_srcIndex;
			width		= Ptr.p_width;
			zeroPad		= Ptr.p_zeroPad;
			
            if (str[@ srcIndex] != "d" && str[@ srcIndex] != "x") {
                break;
            }
            if (str[@ srcIndex] == "d") {
                base = 10;
            }
            if (str[@ srcIndex] == "x") {
                base = 16;
            }

            srcIndex++;

            format_integer(n, base, sTextLabels[sTextLabelsCount].buffer, len, width, zeroPad);
			len = Ptr.p_totalLength;
        } else // straight copy
        {
            sTextLabels[sTextLabelsCount].buffer[len] = c;
            len++;
            srcIndex++;
        }
		if (srcIndex>=array_length(str)) break;
        c = str[@ srcIndex];
    }

    sTextLabels[sTextLabelsCount].length = len;
    sTextLabelsCount++;
}

/// <pygml?v=1.0&h=e9de30c79>
/// @function	print_text(x, y, str)
/// @desc		Prints text in the colorful lettering at given X, Y
///					coordinates.
/// @param		{s32}		x
/// @param		{s32}		y
/// @param		{const}		str
function print_text(_x, _y, _str) {
    var c = 0;
    var length = 0;
    var srcIndex = 0;
	
    // Don't continue if there is no memory to do so.
    if (sTextLabelsCount>51) return;

    sTextLabels[sTextLabelsCount].x = _x;
    sTextLabels[sTextLabelsCount].y = _y;

	var str = array_create(string_length(_str));
	for(var i = 1; i<= string_length(_str); i++) str[i-1] = string_char_at(_str, i);	
    c = str[@ srcIndex];

    // Set the array with the text to print while finding length.
    while (true) {
        sTextLabels[sTextLabelsCount].buffer[length] = c;
        length++;
        srcIndex++;
		if (srcIndex>=array_length(str)) break;
        c = str[@ srcIndex];
    }

    sTextLabels[sTextLabelsCount].length = length;
	
    sTextLabelsCount++;
}

/// <pygml?v=1.0&h=4adbdff80>
/// @function	print_text_centered(x, y, str)
/// @desc		Prints text in the colorful lettering centered at given X, Y
///					coordinates.
/// @param		{s32}		x
/// @param		{s32}		y
/// @param		{const}		str
function print_text_centered(_x, _y, _str) {
    var c = 0;
    var unused1 = 0;
    var unused2 = 0;
    var length = 0;
    var srcIndex = 0;

    // Don't continue if there is no memory to do so.
    if (sTextLabelsCount>51) return;

	var str = array_create(string_length(_str));
	for(var i = 1; i<= string_length(_str); i++) str[i-1] = string_char_at(_str, i);	
    c = str[@ srcIndex];

    // Set the array with the text to print while finding length.
    while (c != 0) {
        sTextLabels[sTextLabelsCount].buffer[length] = c;
        length++;
        srcIndex++;
		if (srcIndex>=array_length(str)) break;
        c = str[@ srcIndex];
    }

    sTextLabels[sTextLabelsCount].length = length;
    sTextLabels[sTextLabelsCount].x = _x - length * 12 / 2;
    sTextLabels[sTextLabelsCount].y = _y;
    sTextLabelsCount++;
}

/// <pygml?v=1.0&h=b217f244b>
/// @function	char_to_glyph_index(c)
/// @desc		Converts a char into the proper colorful glyph for the char.
/// @param		{char}		c
/// @returns	s8
function char_to_glyph_index(c) {
	c = ord(c);
    if (c >= ord("A") && c <= ord("Z")) {
        return c - 55;
    }

    if (c >= ord("a") && c <= ord("_z")) {
        return c - 87;
    }

    if (c >= ord("0") && c <= ord("9")) {
        return c - 48;
    }

    if (c == ord(" ")) {
        return GLYPH_SPACE;
    }

    if (c == ord("!")) {
        return GLYPH_EXCLAMATION_PNT; // !, JP only
    }

    if (c ==ord( "#")) {
        return GLYPH_TWO_EXCLAMATION; // !!, JP only
    }

    if (c == ord("?")) {
        return GLYPH_QUESTION_MARK; // ?, JP only
    }

    if (c == ord("&")) {
        return GLYPH_AMPERSAND; // &, JP only
    }

    if (c == ord("%")) {
        return GLYPH_PERCENT; // %, JP only
    }

    if (c == ord("*")) {
        return GLYPH_MULTIPLY; // _x
    }

    if (c == ord("+")) {
        return GLYPH_COIN; // coin
    }

    if (c == ord(",")) {
        return GLYPH_MARIO_HEAD; // Imagine I drew Mario"s head
    }

    if (c == ord("-")) {
        return GLYPH_STAR; // star
    }

    if (c == ord(".")) {
        return GLYPH_PERIOD; // large shaded dot, JP only
    }

    if (c == ord("/")) {
        return GLYPH_BETA_KEY; // beta key, JP only. Reused for Ü in EU.
    }

    return GLYPH_SPACE;
}

/// <pygml?v=1.0&h=42f734b9b>
/// @function	add_glyph_texture(glyphIndex)
/// @desc		Adds an individual glyph to be rendered.
/// @param		{s8}		glyphIndex
function add_glyph_texture(glyphIndex) {
	var glyphs = main_hud_lut;

    //gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayList, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, glyphs[glyphIndex]);
    gSPDisplayList(gDisplayList, dl_hud_img_load_tex_block);
}

/// <pygml?v=1.0&h=1ec7c2bd1>
/// @function	clip_to_bounds(Ptr.p_x, Ptr.p_y)
/// @param		{s32}		Ptr.p_x
/// @param		{s32}		Ptr.p_y
function clip_to_bounds(_x, _y) {
    if (_x < TEXRECT_MIN_X) {
        _x = TEXRECT_MIN_X;
    }

    if (_x > TEXRECT_MAX_X) {
        _x = TEXRECT_MAX_X;
    }

    if (_y < TEXRECT_MIN_Y) {
        _y = TEXRECT_MIN_Y;
    }

    if (_y > TEXRECT_MAX_Y) {
        _y = TEXRECT_MAX_Y;
    }

    Ptr.p_x = _x;
    Ptr.p_y = _y;
}


/// <pygml?v=1.0&h=daef1ecbf>
/// @function	render_textrect(x, y, pos)
/// @desc		Renders the glyph that's set at the given position.
/// @param		{s32}		x
/// @param		{s32}		y
/// @param		{s32}		pos
function render_textrect(_x, _y, pos) {
    var rectBaseX = _x + pos * 12;
    var rectBaseY = 224 - _y
    var rectX;
    var rectY;

	var ortho_layer = TRI_MODE_ORTHO;

    rectX = rectBaseX;
    rectY = rectBaseY;
    gSPTextureRectangle(gDisplayList, rectX << 2, rectY << 2, (rectX + 15) << 2,
        (rectY + 15) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10, ortho_layer);
}

/// <pygml?v=1.0&h=5a99c989b>
/// @function	render_text_labels()
/// @desc		Renders the text in sTextLabels on screen at the proper
///					locations by iterating  a for loop.
function render_text_labels() {
    var glyphIndex;
    var mtx = Mat4;

    if (sTextLabelsCount == 0) {
        return;
    }

    guOrtho(mtx, 0.0, SCREEN_WIDTH, 0.0, SCREEN_HEIGHT, -10.0, 10.0, 1.0);
    //gSPPerspNormalize(gDisplayList, 0xFFFF);
    gSPMatrix(gDisplayList, mtx, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH);
    gSPDisplayList(gDisplayList, dl_hud_img_begin);

    for (var i = 0; i < sTextLabelsCount; i++) {
        for (var j = 0; j < sTextLabels[i].length; j++) {
            glyphIndex = char_to_glyph_index(sTextLabels[i].buffer[j]);

            if (glyphIndex != GLYPH_SPACE) {
                add_glyph_texture(glyphIndex);
                render_textrect(sTextLabels[i].x, sTextLabels[i].y, j);
			}
        }

    }

    gSPDisplayList(gDisplayList, dl_hud_img_end);

    sTextLabelsCount = 0;
}


function temp_text(_x, _y, _str) {
	var str = string(floor(_str));
	for(var i = 1; i <= string_length(str); i++) {
		draw_sprite(texture_hud_char_0 + real(string_char_at(str, i)), 0, _x + (i * 16), _y);
	}	
}