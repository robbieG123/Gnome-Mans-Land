extends Node

var day = 1;
var test = false

func _ready():
	if test == false:
		$Player.visible = false
		$TitleScreen.visible = false
		$HomeMap.visible = false
		
		$Player/Audio/Music.playing = false
		$Player/Camera2D/Hours/Timer.stop()
		$TitleScreen/Camera2D.current = false
		$OpeningCutscene/Camera2D.current = true
		$OpeningCutscene/Float.play("Float")
		$OpeningCutscene/Text.play("Float")
	else:
		$TitleScreen/Camera2D.current = true
		$OpeningCutscene.visible = false
		$OpeningCutscene.hide()


func _on_TitleScreen_new_game():
	print ("start the game")
	$Player.visible = true
	$Player/Camera2D/Hours/Timer.start()
	$TitleScreen.visible = false
	$TitleScreen/Camera2D.current = false
	$Player/Audio/Music.playing = true
	$HomeMap.visible = true
	$Player/Camera2D.current = true
	$OpeningCutscene/Song.playing = false
	$HomeMap/Node2D/Path1/CharacterFollower2D.offset = 0
	$HomeMap/Node2D/Path2/CharacterFollower2D.offset = 0
	$HomeMap/Node2D/Path3/CharacterFollower2D.offset = 0

func _on_OpeningCutscene_start_game():
	if test == false:
		$TitleScreen.visible = true
		$HomeMap.visible = true
		$OpeningCutscene.visible = false
		$Player/Audio/Music.playing = false
		$TitleScreen/Camera2D.current = true
		$OpeningCutscene/Camera2D.current = false
	else:
		pass
