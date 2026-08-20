globalvar fnt_big;
fnt_big = font_add_sprite_ext(spr_font, "!.0123456789:ABCDEFGHIJKLMNOPQRSTUVWXYZ", true, 0)

globalvar fnt_small;
fnt_small = font_add_sprite_ext(spr_smallfont, "!.0123456789:?ABCDEFGHIJKLMNOPQRSTUVWXYZ", true, 0)

globalvar fnt_pizzascore;
fnt_pizzascore = font_add_sprite_ext(spr_pizzafont, "0123456789", true, 0)

globalvar fnt_combo;
fnt_combo = font_add_sprite_ext(spr_combofont, "0123456789", true, 0)

globalvar fnt_debug;
fnt_debug = font_add_sprite_ext(spr_debugfont, "►!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~◄", true, 0)