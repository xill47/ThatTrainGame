extends Control

func _ready():
	show_git_hash()

func show_git_hash():
	var git_label: Label = %GitHash
	if FileAccess.file_exists("res://git_hash.txt"):
		var file = FileAccess.open("res://git_hash.txt", FileAccess.READ)
		var git_hash = file.get_line()
		file.close()
		git_label.text = git_hash
	else:
		var output = []
		OS.execute("git", ["rev-parse", "--short", "HEAD"], output)
		git_label.text = output[0]
