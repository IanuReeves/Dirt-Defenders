extends StaticBody2D
class_name Planet

@onready var health = $HealthComponent
@onready var healthind: Label = $CanvasLayer/Label
@onready var shape: CollisionShape2D = $Area2D/CollisionShape2D
@onready var world = get_parent()

var last_score : int 
var score_file : scorefile = load("res://deathscreen/score.tres")
const DEATHSCREEN = preload("res://deathscreen/deathscreen.tscn")


func die(cause) -> void:
	last_score = world.score
	score_file.last_score = last_score
	ResourceSaver.save(score_file, "res://deathscreen/score.tres")
	get_tree().change_scene_to_packed(DEATHSCREEN)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	healthind.text = str(health.current)


func _on_body_touched(area: Area2D) -> void:
	if area is Projectile:
		area.queue_free()

func damage(attack, cause):
	health.damage(attack, cause)
