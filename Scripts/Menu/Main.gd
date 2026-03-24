extends Control


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	var dir = DirAccess.open("user://")
	if dir.dir_exists("user://Launcher/Game/"):
		$Menu/MenuMargin/MenuVBox/MainMenu/StartBtn.disabled = false
		$Menu/MenuMargin/MenuVBox/MainMenu/StartBtn.visible = true
	else:
		$Menu/MenuMargin/MenuVBox/MainMenu/StartBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/MainMenu/StartBtn.visible = false
		$Menu/MenuMargin/MenuVBox/MainMenu/ChkUpdtsBtn/Label.text = "Download Game!"
