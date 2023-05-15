extends State

class_name AttackState

@export var return_state: State
@export var return_node: String = "move"
@export var attack_1_animation: String = "attack1"
@export var attack_2_animation: String = "attack2"
@export var attack_2_node: String = "attack2"

@onready var timer: Timer = $Timer

func handle_input(event: InputEvent):
	if event.is_action_pressed(Constants.ATTACK_BTN):
		timer.start()

func _on_animation_tree_animation_finished(current_animation):
	if current_animation == attack_1_animation:
		if timer.is_stopped():
			next_state = return_state
			playback.travel(return_node)
		else:
			playback.travel(attack_2_node)

	if current_animation == attack_2_animation:
		next_state = return_state
		playback.travel(return_node)
