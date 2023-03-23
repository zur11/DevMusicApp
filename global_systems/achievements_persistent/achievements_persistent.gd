extends Node

const _SAVED_ACHIEVEMENTS_PATH := "user://achievements.tres"


#func _change_saved_achievements_var(new_achievements_to_save:SavedAchievements):
#	var saved_achievements = load_saved_achievements_from_disk()
#	saved_achievements = new_achievements_to_save
	
	

func _save_achievements_to_disk(saved_achievements:SavedAchievements) -> void:
#	var saved_achievements2 := SavedAchievements.new()
	var result = ResourceSaver.save(saved_achievements, _SAVED_ACHIEVEMENTS_PATH)
	assert(result == OK)


func load_saved_achievements_from_disk() -> SavedAchievements:
	var saved_achievements
	if ResourceLoader.exists(_SAVED_ACHIEVEMENTS_PATH):
	
		saved_achievements = load(_SAVED_ACHIEVEMENTS_PATH) #as SavedAchievements
		print(saved_achievements.global_achievements.h_app_opened_counter)
	else: saved_achievements = SavedAchievements.new()

	return saved_achievements

