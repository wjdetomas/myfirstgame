# npc.gd - NPC Interaction Script
extends Area2D

# Signal for interaction detection
#signal interacted

# Message to display when interacted
#var message = "Hello, adventurer! Welcome to this world!"
@export var message: String = "Default message."

# Detect if the player is in range
#func _on_NPC_area_entered(area):
#	if area.is_in_group("player"):
#		# Signal that the player is nearby
#		emit_signal("interacted", message)

func _ready():
	# Add this NPC to the "npc" group for detection
	add_to_group("npc")
