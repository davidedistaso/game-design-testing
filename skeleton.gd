extends Node

class_name Skeleton

@export_range(0, 1) var percentage_cost = 0.1
@export var base_attack_power : int
@export var hits_per_second = 0.3

func _ready() -> void:
	var absolute_cost = get_parent().base_attack_power * percentage_cost
	base_attack_power = absolute_cost
	get_parent().base_attack_power -= absolute_cost
	attack()
	
func attack() -> void:
	for dragon in get_tree().get_nodes_in_group("Dragons"):
		dragon.attacked(base_attack_power * hits_per_second)
	await get_tree().create_timer(1).timeout
	attack()
