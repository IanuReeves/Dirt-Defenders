extends CharacterBody2D
enum STATE {HUNTING, ATTACKING,SHOOTING}
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
	set_state()
	match state:
		STATE.HUNTING:
			hunt_tick()
		STATE.SHOOTING:
			shoot_tick()
		STATE.ATTACKING:
			attack_tick()
	if target:
		look_at(target)
		if position.distance_to(target) > stats.desired_distance_from_target:
			velocity = transform.x*stats.speed
	move_and_slide()
func set_state():
	if $Detection_range.get_overlapping_bodies().filter(is_player).size() > 0 and not position.distance_to(target) <= stats.desired_distance_from_target:
		state = STATE.HUNTING
	elif position.distance_to(target) <= stats.desired_distance_from_target:
		state = STATE.SHOOTING
	else:
		#state = STATE.ATTACKING
		pass
func is_player(value):
	if value is Player:
		return true
	return false
func sort_dist(a,b):
	if a.length() > b.length():
		return true
	return false
func attack_tick():
	target = to_local(Vector2(0,0))
func shoot_tick():
	look_at(target)
	$Weapon.fire(velocity,stats.attack,900)
