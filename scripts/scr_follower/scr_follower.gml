global.followerList = ds_list_create()
function follower_add()
{
	if (ds_list_find_index(global.followerList, id) == -1)
		ds_list_add(global.followerList, id)
	follower_get_pos()
}

function follower_delete()
{
	var pos = ds_list_find_index(global.followerList, id)
	if (pos == -1)
		exit;
	
	ds_list_delete(global.followerList, pos)
	var _id = id
	with (obj_followerParent)
	{
		if (id != _id)
			follower_get_pos()
	}
}

function follower_get_pos()
{
	var pos = ds_list_find_index(global.followerList, id)
	followID = (pos > 0 ? ds_list_find_value(global.followerList, pos - 1) : obj_player)
}

function follower_add_to_front()
{
	var p = ds_list_find_index(global.followerList, id)
	if (p != -1)
		ds_list_delete(global.followerList, p)
		
	ds_list_insert(global.followerList, 0, id)
	with (obj_followerParent)
		follower_get_pos()
}

function follower_has_follower(obj)
{
	var len = ds_list_size(global.followerList)
	for (var i = 0; i < len; i++)
	{
		var b = ds_list_find_value(global.followerList, i)
		if (instance_exists(b) && b.object_index == obj)
			return true;
	}
	return false;
}