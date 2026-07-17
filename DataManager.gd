extends Node

const SAVE_PATH = "user://progress.json"

func save_data():
	var data = {
		"mode": GameManager.mode,
		"modes_unlocked": GameManager.modes_unlocked,
		"player_pos_x": 0,  # берёшь у игрока
		"player_pos_y": 0,
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func load_data():
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()

	GameManager.mode           = data.get("mode", "")
