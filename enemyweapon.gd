extends Weapon



func fire():
	stats.bullet_speed = handler.stats.bullet_speed
	stats.attack = handler.stats.attack
	shoot(stats)
