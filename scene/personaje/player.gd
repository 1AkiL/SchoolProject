extends CharacterBody2D
@export var Speed: float = 300.0
@export var Jump_Velocity: float = -400.0
@export var second_jump_velocity: float= -600
var double_jumped: bool=false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_fireball:bool=true
signal fireball(pos,direction)
var playerRight:bool=true
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		double_jumped=false
	if Input.is_action_just_pressed("Salto"):
		if is_on_floor():
			velocity.y = Jump_Velocity
			
		elif not double_jumped:
			velocity.y=second_jump_velocity
			double_jumped=true
	
	var direction = Input.get_axis("Izquierda", "Derecha")
	if direction:
		velocity.x = direction * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
	move_and_slide()
func _process(delta):
	if Input.is_action_just_pressed("Ataque") and can_fireball:
		var fireball_start=$MarkerFireball.get_children()
		print ("Bola de fuego")
		can_fireball=false
		$TimerFIREBALL.start()
		fireball.emit() 


func _on_timer_fireball_timeout():
	can_fireball=true



