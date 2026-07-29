function approach(a, b, amount)
{
	if (a < b)
	{
		a += amount
		if (a > b)
			return b;
	}
	else
	{
		a -= amount
		if (a < b)
			return b;
	}
	
	return a;
}

function wave(from, to, duration, offset, time = noone)
{
	var a4 = (to - from) * 0.5
	
	var t = current_time
	if (time != noone)
		t = time
	
	return from + a4 + (sin((((t * 0.001) + (duration * offset)) / duration) * (pi * 2)) * a4);
}

///@param val
///@param min
///@param max
function wrap(_val, _min, _max)
{
	if (_val % 1 == 0)
	{
		while (_val > _max || _val < _min)
		{
			if (_val > _max)
				_val = _min + _val - _max - 1
			else if (_val < _min)
				_val = _max + _val - _min + 1
		}
		
		return _val;
	}
	else
	{
		var _old = _val + 1
		while (_val != _old)
		{
			_old = _val
			if (_val < _min)
				_val = _max - (_min - _val)
			else if (_val > _max)
				_val = _min + (_val - _max)
		}
		
		return _val;
	}
}