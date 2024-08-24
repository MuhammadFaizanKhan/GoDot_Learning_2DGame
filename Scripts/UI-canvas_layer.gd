extends CanvasLayer
class_name UI

@onready var lblScore = %Label_Score;
@onready var uiBoxLevelCompleted = %MarginContainer_GameCompleted;
var score = 0
var maxScore = 30

func update_score(value):
	score += value
	UpdateScoreLabel()
	
	if score >= maxScore:
		uiBoxLevelCompleted.visible = true
		lblScore.visible = false
	
func UpdateScoreLabel():
	lblScore.text = "Score: "+ str(score)

func _on_button_pressed():
	get_tree().reload_current_scene()
