extends Node2D
var fireball_Scene: PackedScene= preload("res://scene/projectile/fireball.tscn")
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_firebal_trigger(pos):
	var fireball= fireball_Scene.instantiate() as Area2D
	fireball.position=pos
	$Projectile.add_child(fireball)
	pass
