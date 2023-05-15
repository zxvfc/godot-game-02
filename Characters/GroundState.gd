extends State

class_name GroundState

@export var jump_velocity: float = -150.0
@export var air_state: State
@export var jump_animation_node: String = "jump"
@export var attack_state: State
@export var attack_animation_node: String = "attack"

func state_process(delta):
	if !character.is_on_floor():
		next_state = air_state

func handle_input(event: InputEvent):
	if event.is_action_pressed(Constants.JUMP_BTN):
		jump()
	if event.is_action_pressed(Constants.ATTACK_BTN):
		attack()
		
func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation_node)

func attack():
	next_state = attack_state
	playback.travel(attack_animation_node)
