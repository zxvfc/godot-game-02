extends Node

const JUMP_BTN = "jump"
const LEFT_BTN = "left"
const RIGHT_BTN = "right"
const UP_BTN = "up"
const DOWN_BTN = "down"
const ATTACK_BTN = "attack"

const BLEND_POSITION_PATH = "parameters/move/blend_position"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
