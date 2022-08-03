if !surface_exists(gamesurface)
	gamesurface = surface_create(gamewidth, gameheight)
if !surface_exists(tempsurface)
	tempsurface = surface_create(gamewidth, gameheight)	

if keyboard_check_pressed(ord("C")) {
	surface_set_target(gamesurface)
	draw_clear(c_black)
	surface_reset_target()	
}

if keyboard_check(ord("K")) {
	
	surface_set_target(gamesurface)
	draw_clear(c_black)
	shader_set(shd_randomize)
	
	var uni = shader_get_uniform(shd_randomize, "rand")	
	shader_set_uniform_f(uni, random_range(60000, 80000))
	draw_surface(gamesurface, 0, 0)
	shader_reset()
	
	surface_reset_target()	
}


if keyboard_check(ord("L")) or keyboard_check_pressed(ord("M")) {
	
	surface_set_target(tempsurface)
	draw_clear(c_black)
	shader_set(shd_iteration)
	
	var uni = shader_get_uniform(shd_iteration, "res_x")	
	shader_set_uniform_f(uni, gamewidth)
	var uni = shader_get_uniform(shd_iteration, "res_y")	
	shader_set_uniform_f(uni, gameheight)
	draw_surface(gamesurface, 0, 0)
	
	
	shader_reset()
	surface_reset_target()	
	
	surface_copy(gamesurface, 0, 0, tempsurface)
}
		

if mouse_wheel_up() {
	user_zoom *= 1.2

}
	
if mouse_wheel_down() {
	user_zoom /= 1.2

}


if mouse_check_button(mb_left) {
	var mousediff_x = mouse_x - mouse_x_previous 	
	var mousediff_y = mouse_y - mouse_y_previous
	
	user_x += mousediff_x
	user_y += mousediff_y
}
mouse_x_previous = mouse_x
mouse_y_previous = mouse_y
var scale = user_zoom
surface_x = displaywidth / 2 - gamewidth * scale / 2 + user_x
surface_y = displayheight / 2 - gameheight * scale / 2 + user_y
draw_surface_stretched(gamesurface, surface_x, surface_y, gamewidth * scale, gameheight * scale)


draw_set_color(c_fuchsia)
draw_text(30, 50, fps)