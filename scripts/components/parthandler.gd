extends Node2D
class_name PartHandler
# the partHandler's purpose is to act as an intermediary between the player and the part system

# init empty statsheet
var stats:PlayerStats = PlayerStats.new()
#refs to other (player) components
@export var healthcomponent:HealthComponent
@export var sprite:Sprite2D
@export var primary_weapon:Weapon
@export var secondary_weapon:Weapon
@export var hull:Hull

@onready var ui = get_parent().get_node("UI")
# on ready configure sprite and HP if they exist
func _ready() -> void:
	stats = fetch_stats()
# fetch current player velocity
func get_velocity() -> Vector2:
	return get_parent().velocity
# aggregate stats from child parts
func fetch_stats() -> PlayerStats:
	# init empty statsheet
	var value = PlayerStats.new()
	# for each part (child) that has stats
	for node in get_children():
		if node is Part and node.stats:
			# sum/add each common stat to empty statsheet if they are numbers (int, float)
			for property in node.stats.get_property_list():
				if property.usage & PROPERTY_USAGE_SCRIPT_VARIABLE\
				and typeof(value[property.name]) & (TYPE_INT|TYPE_FLOAT)\
				and typeof(value[property.name]) & (TYPE_INT|TYPE_FLOAT):
					value[property.name] += node.stats[property.name]
	# return the total stats
	return value

func _process(delta: float) -> void:
	stats = fetch_stats()
	if hull:
		sprite.texture = hull.texture
# fire primary weapon
func fire_primary():
	primary_weapon.fire(get_velocity(),stats.attack,stats.bullet_speed,stats.bullet_amount,stats.bullet_spread)

func _on_child_entered_tree(node: Node) -> void:
	if node is Part:
		node.player = get_parent()

func setUI():
	for child in get_children():
		if child is Part:
			ui.part2check = child
