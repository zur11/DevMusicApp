extends Node

const _SAVED_ACHIEVEMENTS_PATH := "user://achievements.tres"

var achievements_to_save : SavedAchievements


func change_achievements_to_save_var(new_achievements_to_save:SavedAchievements):
	achievements_to_save = new_achievements_to_save

func _save_achievements_to_disk() -> void:
	var result = ResourceSaver.save(achievements_to_save, _SAVED_ACHIEVEMENTS_PATH)
	assert(result == OK)

func load_saved_achievements_from_disk() -> SavedAchievements:
	var saved_achievements
	if ResourceLoader.exists(_SAVED_ACHIEVEMENTS_PATH):
	
		saved_achievements = load(_SAVED_ACHIEVEMENTS_PATH) # as SavedAchievements
	
	else: saved_achievements = SavedAchievements.new()

	return saved_achievements

