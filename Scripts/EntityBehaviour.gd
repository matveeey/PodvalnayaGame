extends KinematicBody2D

# Translate coordinates to iso
func cartesian_to_isometric(cartesian):
	return Vector2(cartesian.x - cartesian.y, (cartesian.x + cartesian.y) / 2)

# Translate coordinates to normal
func isometric_to_cartesian(iso):
	var cart_pos = Vector2()
	cart_pos.x = (iso.x + iso.y * 2) / 2
	cart_pos.y = -iso.x + cart_pos.x
	return cart_pos
