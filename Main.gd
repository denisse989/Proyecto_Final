extends Node2D


var start = false
var die=false
var score
var time=0

var Tree_scene = preload("res://Obstaculos.tscn")


func _process(delta):
	if !start:
		if Input.is_action_just_pressed("saltar"):
			start=true
			$Player.start = true
			$BackGround.playing = true
			$Timer.start()


func _on_Timer_timeout():
	spawn_tree()
	
func spawn_tree():
		var tree = Tree_scene.instance()
		add_child(tree)
		tree.position = Vector2(950,447)
		tree.start = true
		tree.connect("body_entered", self, "game_over")

			

func game_over(body):
	$Timer.stop()
	$BackGround.playing = false
	var trees = get_tree().get_nodes_in_group('tree')
	for tree in trees:
		tree.start = false
	
