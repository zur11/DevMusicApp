class_name SceneManager extends Node2D

var _async_loader = AsyncLoader.new()
var _container: Node2D

var _current_packed_scene : PackedScene
var _current_instanced_scene: Node
var _previous_packed_scene: PackedScene
var _scene_history : Array

var _theme = "theme_1"

func goto_scene_without_history(packed_scene_to_go: PackedScene):
	if _container.get_child_count() != 0 and packed_scene_to_go.resource_path == _container.get_child(0).scene_file_path: return
	
	_current_instanced_scene = packed_scene_to_go.instantiate()

	_change_scene(_current_instanced_scene)

func _change_scene(instanced_scene_to_go: Node):
	#Erase previous_scene_nodes from tree and memory
	if _container.get_child_count() != 0:
		for child in _container.get_children():
			child.queue_free()

	#instanciate the new scene and add it to the tree
	_container.add_child(instanced_scene_to_go)

#FUNCTIONS FOR HISTORY

func goto_scene(packed_scene_to_go: PackedScene):
	assert(packed_scene_to_go != null, "must select a scene to go")
	if packed_scene_to_go == _current_packed_scene: return

	if _current_packed_scene: 
		_scene_history.push_back(_current_packed_scene.resource_path.trim_suffix(_theme + ".tscn"))
		_previous_packed_scene = _current_packed_scene
	
	_current_packed_scene = packed_scene_to_go
	_current_instanced_scene = _current_packed_scene.instantiate()

	_change_scene(_current_instanced_scene)

func goto_previous_scene():
	if !_previous_packed_scene : return
	_change_scene(_previous_packed_scene.instantiate())

	_current_packed_scene = _previous_packed_scene
	
	_scene_history.pop_back()
	_previous_packed_scene = load(_scene_history[_scene_history.size() - 1] + _theme + ".tscn") if _scene_history.size() > 0 else null

#FUNCTIONS FOR HISTORY WITH THEMES

func update_theme(new_theme: String):
	if _previous_packed_scene:
		_previous_packed_scene = load(_previous_packed_scene.resource_path.trim_suffix(_theme + ".tscn") + new_theme + ".tscn" )
	if _current_packed_scene:
		_current_packed_scene = load(_current_packed_scene.resource_path.trim_suffix(_theme + ".tscn") + new_theme + ".tscn" )
		_current_instanced_scene = _current_packed_scene.instantiate()

	self._change_scene(_current_instanced_scene)

	_theme = new_theme

#FUNCTIONS FOR THREADED LOADING
func async_load(scene_urls: Array):
	_async_loader.load_scenes(scene_urls)
