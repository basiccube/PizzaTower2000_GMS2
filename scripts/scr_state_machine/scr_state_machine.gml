///@param {Function} update
///@param {Function} enter
///@param {Function} leave
function State(updatefunc = func_empty, enterfunc = func_empty, leavefunc = func_empty) constructor
{
	update = method(other, updatefunc)
	enter = method(other, enterfunc)
	leave = method(other, leavefunc)
}

///@param {String} initialState
function StateMachine(initialState) constructor
{
	state = initialState
	states = {}
	time = 0
	
	///@param {String} stateName
	///@param {Struct.State} stateStruct
	add = function(stateName, stateStruct)
	{
		if exists(stateName)
			print("State ", stateName, " already exists, replacing")
		
		states[$ stateName] = stateStruct
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
		state = stateName
		
		if doLeave
		{
			var prevState = states[$ prevName]
			prevState.leave()
		}
		
		if doEnter
		{
			var newState = states[$ stateName]
			newState.enter()
		}
		
		time = get_timer()
		return self;
	}
	
	///@param {String, Array} stateName
	is = function(stateName)
	{
		if is_array(stateName)
			return array_contains_bscotch(stateName, state);
		
		return (state == stateName);
	}
	
	///@param {String} stateName
	exists = function(stateName)
	{ return variable_struct_exists(states, stateName); }
	
	get_current_state = function()
	{ return state; }
	
	get_states = function()
	{ return variable_struct_get_names(states); }
	
	get_time = function()
	{ return get_timer() - time; }
	
	update = function()
	{
		var currentState = states[$ state]
		currentState.update()
	}
}