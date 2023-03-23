class_name Game extends Resource

@export var game_name: String : set = set_game_name
@export var game_achievements:GameAchievements 

@export var question_packed_scene: PackedScene
@export var answers_packed_scene: PackedScene

func set_game_name(new_value):
	game_name = new_value
	if not game_achievements:
		game_achievements = GameAchievements.new(self)


