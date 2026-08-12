draw_set_align(fa_left, fa_top)
draw_set_font(fnt_launcher)

draw_text_alt(8, SCREEN_HEIGHT / 2, "State: " + state.state)
draw_text_alt(8, SCREEN_HEIGHT / 2 + 16, "Previous State: " + state.prevstate)