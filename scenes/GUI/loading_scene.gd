extends CanvasLayer

## TODO: Animationen

@onready var progress_bar: ProgressBar = $Panel/MarginContainer/ProgressBar


func _ready() -> void:
	SceneManager.loading_progress_updated.connect(update_progressbar)
	SceneManager.loading_finished.connect(finish_loading)


func update_progressbar(value: float):
	progress_bar.set_value_no_signal(value * 100)


func finish_loading():
	self.queue_free()
