function array_class_macros_init() {
	#macro BASE_ARRAY_SIZE (40)	
	boot("array_class_macros_init");
}

function Array() constructor {
	
	content		= array_create(BASE_ARRAY_SIZE);
	size		= 0;
	
	// init
	for(var i = 0; i < argument_count; i++) {
		content[++size-1] = argument[i];
	}
	
	static clear = function() {
		size = 0;
	}

	static push = function(value) {
		for(var i = 0; i < argument_count; i++) {
			content[++size-1] = argument[i];
		}
	}

	static concat = function(_other) {
		for(var i = 0; i < _other.size; i++) {
			content[++size-1] = _other.content[i];
		}
	}

	
	static remove = function(pos) {
		
		pos += (pos < 0) ? size : 0;

		if (size == 0 || pos < 0 or pos > size - 1) return;
		
		var part1 = slice(0, pos);
		var part2 = slice(pos+1);
		
		part1.concat(part2);
		
		content = part1.content;
		size--;
	}

	static get = function(pos) {
			
		pos += (pos < 0) ? size : 0;
			
		if (size == 0 && pos == 0 || (size == 0 || pos < 0 || pos > size-1)) {
			return null;	 // @z
		}
		
		return content[pos];
	}
	
	static insert = function(pos, value) {
		
		pos += (pos < 0) ? size : 0;
		
		if(pos < 0 || (pos > size-1 && size != 0)) {
			return set(pos, value);
		}
		
		var part1 = slice(0, pos);
		var part2 = slice(pos);
		
		part1.push(value);
		part1.concat(part2);
		
		content = part1.content;
		size++;
		
		return self;
	}
	
	static last = function() {
		return content[size-1];
	}
	
	static pop = function() {
		ans = last();
		var copy_ans = ans;
		if (size<1) return null;
		
		remove(-1);
		
		return copy_ans;
	}

	static pushBack = function(val) {
		insert(0, val);
	}

	static set = function(pos, value) {
		content[pos] = value;
	}

	static slice = function() {
		
		var _begin, _end;
		_begin = argument_count > 0 ? argument[0] : 0;
		_end = argument_count > 1 ? argument[1] : size;
		
		var ans = new Array();
		
		if(_begin > _end) {
			for(var i = _end; i < _begin; i++) {
				ans.pushBack(content[i]);
			}
		}
		else {
			for(var i = _begin; i < _end; i++) {
				ans.push(content[i]);
			}
		}
		
		return ans;
	}

	
}