 extends Navigation2D

#Velocidad del personaje
var charMove
var canMoveToPos =  true
var path = []



#Check para ver si se presiona el click izquierdo
func _input(event):
	if event.is_action_pressed("left_click") and canMoveToPos:
		_update_navigation_path($Character.position, get_local_mouse_position())
	


func _update_navigation_path(start_pos, end_pos):
	#Devuelve el conjunto de puntos que forman el camino mas corto hacia el punto
	path = get_simple_path(start_pos, end_pos, true)
	
	#Borra el camino anterior
	path.remove(0)
	set_process(true)


#Settea la velocidad del personaje
func _process(delta):
	charMove = Inventario.charSpeed
	var walk_distance = charMove * delta
	move_along_path(walk_distance)


#Mueve al personaje por el camino trazado
func move_along_path(distance):
	#Toma como punto de inicio la posición del personaje
	var last_point = $Character.position
	
	
	#Itera por cada punto del camino creado anteriormente, 
	for index in range(path.size()):
		var distance_between_points = last_point.distance_to(path[0])
		if distance <= distance_between_points:
			$Character.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			break
		elif distance < 0.0:
			$Character.position = path[0]
			set_process(false)
			break
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)


func _on_viewport() -> void:
	canMoveToPos = true


func _on_viewport_exited() -> void:
	canMoveToPos = false
