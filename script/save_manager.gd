extends Node
const SAVE_PATH = "user://save_level.json"
var max_unlocked_level = 1

# Fungsi untuk menyimpan level tertinggi yang sudah terbuka
func unlock_level(level: int):
	# Hanya simpan jika level yang diselesaikan lebih tinggi dari level yang sudah terbuka
	if level > max_unlocked_level:
		max_unlocked_level = level
		var save_data = {"level": max_unlocked_level}
		var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
		file.store_line(JSON.stringify(save_data))

# Fungsi untuk memuat data saat di menu utama
func load_level() -> int:
	if not FileAccess.file_exists(SAVE_PATH):
		return 1
		
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var save_data = JSON.parse_string(file.get_as_text())
	
	if save_data and save_data.has("level"):
		max_unlocked_level = save_data["level"]
		return max_unlocked_level
		
	return 1
