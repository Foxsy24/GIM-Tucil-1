extends Node

var score = 0
@onready var score_label: Label = $"../HUD/ScoreLabel"

func add_point():
	if score_label.text != null:
		score += 1
		score_label.text = "Score : " + str(score) + " coins."
		print("label diperbarui")
	else:
		print("something wrong")
	
