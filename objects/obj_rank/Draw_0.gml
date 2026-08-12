draw_set_align(fa_center, fa_top)
draw_set_font(global.font)

var rankstr = "YOU GOT: " + string_upper(global.rank) + " RANK"
draw_text_alt((SCREEN_WIDTH / 2) + irandom_range(-1, 1), 40, rankstr, c_white, statsalpha)
draw_text_alt(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 60, string(global.collect), c_white, statsalpha)

draw_self()