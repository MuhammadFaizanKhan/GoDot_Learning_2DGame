extends Node2D

@onready var ui = %CanvasLayer;

func UpdateUIScore(value):
	ui.update_score(value)
