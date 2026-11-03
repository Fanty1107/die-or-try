extends Node2D

var car_scene :PackedScene = preload("res://scenes/car.tscn")
var score : int = 0
func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	var pos_marker = $CarStartPos.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered", go_to_title)
	
func go_to_title(_body) -> void:
	call_deferred("change_scene")
	
func _on_global_timer_timeout() -> void:
	score+=1
	$CanvasLayer/Label.text = 'Time: ' + str(score)

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn")
	
func _on_finish_area_body_entered(_body: Node2D) -> void:
	if score > Global.score:
		Global.score = score
	call_deferred("change_scene")
	
