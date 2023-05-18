extends State

class_name HitState

@export var damagable: Damagable
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export var knokback_velocity: Vector2 = Vector2(100, 0)
@export var return_state: State

@onready var timer: Timer = $Timer

func _ready():
	damagable.connect("on_hit", on_damagable_hit)
	
func on_enter():
	character.velocity = knokback_velocity
	timer.start()


func on_damagable_hit(node: Node, damage_amount: int):
	if damagable.health > 0:
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)

func on_exit():
	knokback_velocity = Vector2.ZERO


func _on_timer_timeout():
	next_state = return_state
