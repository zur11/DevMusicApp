class_name Game extends Resource

@export var game_name: String : set = set_game_name
@export var game_achievements:GameAchievements 

@export var question_packed_scene: PackedScene
@export var answers_packed_scene: PackedScene

func set_game_name(new_value):
	game_name = new_value

	var game_achievements_array : Array[GameAchievements] = AchievementsManager.saved_achievements.game_achievements_array

	if game_achievements_array.size() != 0:
		for saved_game_achievements in game_achievements_array:
			if saved_game_achievements.h_containing_game_name == game_name:
				game_achievements = saved_game_achievements
	
	if not game_achievements:
		game_achievements = GameAchievements.new(self)


