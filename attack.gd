extends Node

class_name Attack



func _ready() -> void:
	attack()
	
func attack() -> void:
	$"../../Dragon".attacked(get_parent().base_attack_power * get_parent().hits_per_second)
	await get_tree().create_timer(1).timeout
