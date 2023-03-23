extends Control

func _on_go_to_games_menu_pressed():
#	var games_menu_screen: Node = load('res://games_menu/games_menu_theme_1.tscn').instantiate()
	var games_menu_screen: Node = load("res://menus_screens/games_menu/games_menu_theme_1.tscn").instantiate()
	SceneManagerSystem.get_container("ScreenContainer").goto_scene(games_menu_screen)


func _on_go_to_achievements_wall_pressed():
	var achievements_wall_screen: Node = load("res://menus_screens/achievements_wall/achievements_wall.tscn").instantiate()
	
	SceneManagerSystem.get_container("ScreenContainer").goto_scene(achievements_wall_screen)
