# dialog.gd
extends Panel

@onready var label : Label = $DialogText
@onready var yes_button = $ButtonYes
@onready var no_button = $ButtonNo

func _ready():
	hide()
	yes_button.hide()
	no_button.hide()

# Function to display message
func show_message(message: String, show_choices := false):
	label.text = message
	show()
	
	yes_button.visible = show_choices
	no_button.visible = show_choices

# Function to hide dialog
func hide_dialog():
	hide()
	yes_button.hide()
	no_button.hide()

func _on_ButtonYes_pressed():
	label.text = "You chose: Yes!"
	yes_button.hide()
	no_button.hide()

func _on_ButtonNo_pressed():
	label.text = "You chose: No!"
	yes_button.hide()
	no_button.hide()
