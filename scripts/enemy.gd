extends CharacterBody2D
enum STATE {HUNTING, ATTACKING}
@export var state:STATE
@export var stats:EnemyStats
var target:Vector2

func hunt_tick():
	var options = Array()
	for body in $Detection_range.get_overlapping_bodies().filter(is_player):
		options.append(body.global_position)
	options.sort_custom(sort_dist)
	if options.size() > 0 and $Detection_range.get_overlapping_bodies().filter(is_player).size() > 0:
		target = options[0]
func _physics_process(delta: float) -> void:
	if target:
		look_at(target)
		velocity = transform.x*stats.speed
	move_and_slide()
func set_state():
	if $Detection_range.get_overlapping_bodies().filter(is_player).size() > 0:
		state = STATE.HUNTING
	else:
		state = STATE.ATTACKING
func is_player(value):
	if value is Player:
		return true
	return false
func sort_dist(a,b):
	if a.length() > b.length():
		return true
	return false
func _process(delta: float) -> void:
	set_state()
	if state == STATE.HUNTING:
		hunt_tick()
	elif state == STATE.ATTACKING:
		attack_tick()
func attack_tick():
	look_at(get_parent().position)
	velocity = transform.x*stats.speed
	
