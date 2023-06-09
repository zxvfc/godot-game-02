extends Node

class_name State

@export var can_move: bool = true

var character: CharacterBody2D
var playback: AnimationNodeStateMachinePlayback
var next_state: State

signal interrupt_state(new: State)

func on_enter():
	pass

func state_process(delta):
	pass

func handle_input(event: InputEvent):
	pass

func on_exit():
	pass
