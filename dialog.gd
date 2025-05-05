# dialog.gd
extends Panel

@onready var label : Label = $DialogText

func _ready():
	hide()

# Function to display message
func show_message(message: String):
	label.text = message
	show()

# Function to hide dialog
func hide_dialog():
	hide()
