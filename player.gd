# player.gd
extends CharacterBody2D

# Movement speed in pixel per second
var speed := 200

# Track NPC interaction
var interacting := false
var current_npc = null
var dialog = null

func _ready():
	# Cache dialog node (assuming MainGame is root)
	dialog = get_tree().current_scene.get_node("UI/Dialog")

func _physics_process(delta):
	var direction := Vector2.ZERO

	#input checks
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	#Normalize to prevent faster diagonal movement
	direction = direction.normalized()
	
	#Move the player
	velocity = direction * speed
	move_and_slide()

	# Update the label with current position
	var label_node = get_tree().current_scene.get_node("UI/PositionLabel")
	if label_node:
		label_node.text = "x: %.0f, y: %.0f" % [global_position.x, global_position.y]

	# Update the speed label
	var speed_label = get_tree().current_scene.get_node("UI/SpeedLabel")
	if speed_label:
		speed_label.text = "Speed: %d px/s" % speed

	# Check if player is interacting with an NPC
	if Input.is_action_just_pressed("ui_accept") and interacting:
		if current_npc and dialog:
			dialog.show_message(current_npc.message,true)

# Called when player enters an NPC's area
#func _on_InteractionArea_entered(area):
#	if area.is_in_group("npc"):
#		current_npc = area
#		interacting = true
#		if dialog:
#			dialog.show_message("Press E to interact")

# Called when player exits an NPC's area
#func _on_InteractionArea_exited(area):
#	if area.is_in_group("npc"):
#		interacting = false
#		current_npc = null
#		if dialog:
#			dialog.hide_dialog()


func _on_InteractionArea_area_entered(area: Area2D) -> void:
	if area.is_in_group("npc"):
		current_npc = area
		interacting = true
		if dialog:
			dialog.show_message("Press E to interact", false)


func _on_InteractionArea_area_exited(area: Area2D) -> void:
	if area.is_in_group("npc"):
		interacting = false
		current_npc = null
		if dialog:
			dialog.hide_dialog()
