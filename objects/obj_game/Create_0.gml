displaywidth = display_get_width()
displayheight = display_get_height()
surface_resize(application_surface, displaywidth, displayheight)
//max size gamemaker allows is 16384 for width and height
gamewidth = 10000
gameheight = 10000
gamesurface = surface_create(gamewidth, gameheight)
tempsurface = surface_create(gamewidth, gameheight)
window_set_fullscreen(true)

randomize()



user_zoom = 1
user_x = 0
user_y = 0
mouse_x_previous = mouse_x
mouse_y_previous = mouse_y
