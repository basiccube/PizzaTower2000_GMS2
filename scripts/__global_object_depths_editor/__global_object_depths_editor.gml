function __global_object_depths_editor() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time

	// insert the generated arrays here
	global.__objectDepths[0] = -600; // obj_addobj
	global.__objectDepths[1] = -1001; // obj_addobj_close
	global.__objectDepths[2] = -1001; // obj_addobj_custom
	global.__objectDepths[3] = -1001; // obj_addobj_objbutton
	global.__objectDepths[4] = -600; // obj_bgsetup
	global.__objectDepths[5] = -1001; // obj_bgsetup_close
	global.__objectDepths[6] = -1001; // obj_bgsetup_next
	global.__objectDepths[7] = -1001; // obj_bgsetup_prev
	global.__objectDepths[8] = -600; // obj_exportprm
	global.__objectDepths[9] = 0; // obj_open
	global.__objectDepths[10] = 0; // obj_save
	global.__objectDepths[11] = 9999; // obj_bg
	global.__objectDepths[12] = -1001; // obj_button
	global.__objectDepths[13] = 0; // obj_camera_editor
	global.__objectDepths[14] = -6; // obj_editor
	global.__objectDepths[15] = 5; // obj_object
	global.__objectDepths[16] = -1000; // obj_newroom
	global.__objectDepths[17] = -1001; // obj_newroom_no
	global.__objectDepths[18] = -1001; // obj_newroom_yes
	global.__objectDepths[19] = -600; // obj_objmenu
	global.__objectDepths[20] = -1001; // obj_objmenu_delete
	global.__objectDepths[21] = -1001; // obj_objmenu_pos
	global.__objectDepths[22] = -1001; // obj_objmenu_scale
	global.__objectDepths[23] = -1001; // obj_objmenu_var
	global.__objectDepths[24] = -1000; // obj_quitdialog
	global.__objectDepths[25] = -1001; // obj_quitdialog_no
	global.__objectDepths[26] = -1001; // obj_quitdialog_yes
	global.__objectDepths[27] = -600; // obj_roomsettings
	global.__objectDepths[28] = -1001; // obj_roomsettings_close
	global.__objectDepths[29] = -1001; // obj_roomsettings_musicnext
	global.__objectDepths[30] = -1001; // obj_roomsettings_musicprev
	global.__objectDepths[31] = -1001; // obj_roomsettings_name
	global.__objectDepths[32] = -1001; // obj_roomsettings_size
	global.__objectDepths[33] = -500; // obj_scaletoolbar
	global.__objectDepths[34] = -501; // obj_scaletool_down
	global.__objectDepths[35] = -501; // obj_scaletool_left
	global.__objectDepths[36] = -501; // obj_scaletool_right
	global.__objectDepths[37] = -501; // obj_scaletool_up
	global.__objectDepths[38] = -600; // obj_tileui
	global.__objectDepths[39] = -1001; // obj_tileui_close
	global.__objectDepths[40] = -1001; // obj_tileui_next
	global.__objectDepths[41] = -1001; // obj_tileui_prev
	global.__objectDepths[42] = -1001; // obj_tileui_tilearea
	global.__objectDepths[43] = -500; // obj_uibar
	global.__objectDepths[44] = -501; // obj_uibar_button
	global.__objectDepths[45] = -501; // obj_ui_addobj
	global.__objectDepths[46] = -501; // obj_ui_background
	global.__objectDepths[47] = -501; // obj_ui_exit
	global.__objectDepths[48] = -501; // obj_ui_export
	global.__objectDepths[49] = -501; // obj_ui_gridminus
	global.__objectDepths[50] = -501; // obj_ui_gridplus
	global.__objectDepths[51] = -501; // obj_ui_gridreset
	global.__objectDepths[52] = -501; // obj_ui_movemode
	global.__objectDepths[53] = -501; // obj_ui_new
	global.__objectDepths[54] = -501; // obj_ui_open
	global.__objectDepths[55] = -501; // obj_ui_play
	global.__objectDepths[56] = -501; // obj_ui_regularmode
	global.__objectDepths[57] = -501; // obj_ui_roomsettings
	global.__objectDepths[58] = -501; // obj_ui_save
	global.__objectDepths[59] = -501; // obj_ui_scalemode
	global.__objectDepths[60] = -501; // obj_ui_tiles
	global.__objectDepths[61] = -501; // obj_ui_toggletiles


	global.__objectNames[0] = "obj_addobj";
	global.__objectNames[1] = "obj_addobj_close";
	global.__objectNames[2] = "obj_addobj_custom";
	global.__objectNames[3] = "obj_addobj_objbutton";
	global.__objectNames[4] = "obj_bgsetup";
	global.__objectNames[5] = "obj_bgsetup_close";
	global.__objectNames[6] = "obj_bgsetup_next";
	global.__objectNames[7] = "obj_bgsetup_prev";
	global.__objectNames[8] = "obj_exportprm";
	global.__objectNames[9] = "obj_open";
	global.__objectNames[10] = "obj_save";
	global.__objectNames[11] = "obj_bg";
	global.__objectNames[12] = "obj_button";
	global.__objectNames[13] = "obj_camera_editor";
	global.__objectNames[14] = "obj_editor";
	global.__objectNames[15] = "obj_object";
	global.__objectNames[16] = "obj_newroom";
	global.__objectNames[17] = "obj_newroom_no";
	global.__objectNames[18] = "obj_newroom_yes";
	global.__objectNames[19] = "obj_objmenu";
	global.__objectNames[20] = "obj_objmenu_delete";
	global.__objectNames[21] = "obj_objmenu_pos";
	global.__objectNames[22] = "obj_objmenu_scale";
	global.__objectNames[23] = "obj_objmenu_var";
	global.__objectNames[24] = "obj_quitdialog";
	global.__objectNames[25] = "obj_quitdialog_no";
	global.__objectNames[26] = "obj_quitdialog_yes";
	global.__objectNames[27] = "obj_roomsettings";
	global.__objectNames[28] = "obj_roomsettings_close";
	global.__objectNames[29] = "obj_roomsettings_musicnext";
	global.__objectNames[30] = "obj_roomsettings_musicprev";
	global.__objectNames[31] = "obj_roomsettings_name";
	global.__objectNames[32] = "obj_roomsettings_size";
	global.__objectNames[33] = "obj_scaletoolbar";
	global.__objectNames[34] = "obj_scaletool_down";
	global.__objectNames[35] = "obj_scaletool_left";
	global.__objectNames[36] = "obj_scaletool_right";
	global.__objectNames[37] = "obj_scaletool_up";
	global.__objectNames[38] = "obj_tileui";
	global.__objectNames[39] = "obj_tileui_close";
	global.__objectNames[40] = "obj_tileui_next";
	global.__objectNames[41] = "obj_tileui_prev";
	global.__objectNames[42] = "obj_tileui_tilearea";
	global.__objectNames[43] = "obj_uibar";
	global.__objectNames[44] = "obj_uibar_button";
	global.__objectNames[45] = "obj_ui_addobj";
	global.__objectNames[46] = "obj_ui_background";
	global.__objectNames[47] = "obj_ui_exit";
	global.__objectNames[48] = "obj_ui_export";
	global.__objectNames[49] = "obj_ui_gridminus";
	global.__objectNames[50] = "obj_ui_gridplus";
	global.__objectNames[51] = "obj_ui_gridreset";
	global.__objectNames[52] = "obj_ui_movemode";
	global.__objectNames[53] = "obj_ui_new";
	global.__objectNames[54] = "obj_ui_open";
	global.__objectNames[55] = "obj_ui_play";
	global.__objectNames[56] = "obj_ui_regularmode";
	global.__objectNames[57] = "obj_ui_roomsettings";
	global.__objectNames[58] = "obj_ui_save";
	global.__objectNames[59] = "obj_ui_scalemode";
	global.__objectNames[60] = "obj_ui_tiles";
	global.__objectNames[61] = "obj_ui_toggletiles";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
