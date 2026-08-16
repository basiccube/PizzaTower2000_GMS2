global.state_machine_use_map = false

global.state_machine_id_override = noone
function StateOverride(inst)
{
	// Not needed in Butterscotch
	if !global.butterscotch
		exit;
	
	global.state_machine_id_override = inst
}

///@param {Function} update
///@param {Function} enter
///@param {Function} leave
function State(updatefunc = func_empty, enterfunc = func_empty, leavefunc = func_empty) constructor
{
	var inst = other
	if (global.butterscotch && global.state_machine_id_override != noone)
		inst = global.state_machine_id_override
	
	update = method(inst, updatefunc)
	enter = method(inst, enterfunc)
	leave = method(inst, leavefunc)
}

///@param {String} initialState
function StateMachine(initialState) constructor
{
	// Structs in Butterscotch are currently very finicky and don't really work well
	if (global.butterscotch && !global.state_machine_use_map)
	{
		print("Forcing state machines to use maps instead of structs")
		global.state_machine_use_map = true
	}
	
	state = initialState
	states = global.state_machine_use_map ? ds_map_create() : {}
	prevstate = ""
	time = 0
	
	///@param {String} stateName
	///@param {Struct.State} stateStruct
	add = function(stateName, stateStruct)
	{
		if exists(stateName)
			print("State ", stateName, " already exists, replacing")
		
		if global.state_machine_use_map
			ds_map_set(states, stateName, stateStruct)
		else
			variable_struct_set(states, stateName, stateStruct)
		
		return self;
	}
	
	///@param {String} stateName
	///@param {Bool} doEnter
	///@param {Bool} doLeave
	change = function(stateName, doEnter = true, doLeave = true)
	{
		if (state == stateName)
			return self;
		
		if !exists(stateName)
		{
			print("State doesn't exist: ", stateName)
			return self;
		}
		
		var prevName = state
		prevstate = prevName
		state = stateName
		
		if doLeave
		{
			var prevState = global.state_machine_use_map ? ds_map_find_value(states, prevName) : states[$ prevName]
			prevState.leave()
		}
		
		if doEnter
		{
			var newState = global.state_machine_use_map ? ds_map_find_value(states, stateName) : states[$ stateName]
			newState.enter()
		}
		
		
		time = get_timer()
		return self;
	}
	
	///@param {String, Array} stateName
	is = function(stateName)
	{
		if is_array(stateName)
			return in_array(state, stateName);
		
		return (state == stateName);
	}
	
	///@param {String, Array} stateName
	prev_is = function(stateName)
	{
		if is_array(stateName)
			return in_array(prevstate, stateName);
		
		return (prevstate == stateName);
	}
	
	///@param {String} stateName
	exists = function(stateName)
	{ return global.state_machine_use_map ? ds_map_exists(states, stateName) : variable_struct_exists(states, stateName); }
	
	get_current_state = function()
	{ return state; }
	
	get_states = function()
	{
		if global.state_machine_use_map
		{
			var arr = []
			ds_map_keys_to_array(states, arr)
			return arr;
		}
		
		return variable_struct_get_names(states);
	}
	
	get_time = function()
	{ return get_timer() - time; }
	
	update = function()
	{
		var currentState = global.state_machine_use_map ? ds_map_find_value(states, state) : states[$ state]
		currentState.update()
	}
}