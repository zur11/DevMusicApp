class_name SavedAchievements extends Resource

@export var global_achievements := GlobalAchievements.new()
@export var game_achievements_array : Array[GameAchievements]

func replace_saved_global_achievements_var(new_achievements:GlobalAchievements) -> void:
	self.global_achievements = new_achievements
	AchievementsPersistent.change_achievements_to_save_var(self)
	AchievementsPersistent._save_achievements_to_disk()

func add_game_achievements_to_array(new_achievements:GameAchievements) -> void:
	
	if game_achievements_array.size() != 0:
		for ii in game_achievements_array.size():
			if game_achievements_array[ii].h_containing_game_name == new_achievements.h_containing_game_name:
				game_achievements_array[ii] = new_achievements
				AchievementsPersistent.change_achievements_to_save_var(self)
				AchievementsPersistent._save_achievements_to_disk()
				return

	game_achievements_array.append(new_achievements)
	AchievementsPersistent.change_achievements_to_save_var(self)
	AchievementsPersistent._save_achievements_to_disk()
