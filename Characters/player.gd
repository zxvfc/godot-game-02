extends CharacterBody2D

@export var speed : float = 200.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	
	var direction = Input.get_vector(
		Constants.LEFT_BTN, 
		Constants.RIGHT_BTN, 
		Constants.UP_BTN, 
		Constants.DOWN_BTN
	)
	
	if direction.x != 0 && state_machine.can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true

	animation_tree.set(Constants.BLEND_POSITION_PATH, direction.x)

	move_and_slide()
