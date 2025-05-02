extends AnimatedSprite2D


@onready var player : Player = get_parent()
@onready var boostsprite: AnimatedSprite2D = $Boost


func _ready() -> void:
	player.boosted.connect(ondash)



func ondash():
	boostsprite.boost()
	boostsprite.show()
