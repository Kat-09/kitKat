extends Node

var fork = "https://github.com/mclemp/MCLEClient/releases/download/"
var forkExeName = "Minecraft.Client.exe"
var forkZipName = "MCLEWindows64.zip"
var forkName = "mclemp"
var forkTag = "nightly"
var justCameFromUpdate = false
var log = []
var launchMethod = ""

func _ready() -> void:
	match OS.get_name():
		"Windows":
			launchMethod = ""
		"macOS":
			launchMethod = "wine"
		"Linux", "FreeBSD", "NetBSD", "OpenBSD", "BSD":
			launchMethod = "wine"
		"Android":
			launchMethod = "yeah ok what"
		"iOS":
			launchMethod = "yeah uhhh idk how thats gonna work uhhhh hi"
		"Web":
			print("Welcome to the internet have a look around")
