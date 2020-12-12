if (instance_exists(Object1)) exit;

var time = get_timer();

while(get_timer() < (time + 100)) { /**/ }

var inst = instance_create_depth(0, 0, 0, Object1);
inst.persistent = true;