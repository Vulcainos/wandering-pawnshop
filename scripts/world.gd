extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	changeBalanceLabel()
	#lancerJeu()
	Balance.balanceChange.connect(changeBalanceLabel);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func lancerJeu():
	$Saler.reset();


func _on_saler_is_here() -> void:
	#Lancer le shop
	$ShopMenu.showShop();
	$Wanderer.stop();




func _on_shop_menu_leave_shop() -> void:
	$Saler.repart()
	$Wanderer.marcher();

func changeBalanceLabel():
	$BalanceLabel.text = str(Balance.balance)


func _on_start_game_button_pressed() -> void:
	$StartMenuControl.visible = false;
	lancerJeu();
	$Wanderer.marcher();


func _on_saler_nouveau_saler() -> void:
	$ShopMenu.newSaler();


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play();


func _on_check_button_toggled(toggled_on: bool) -> void:
	$AudioStreamPlayer.stream_paused = !toggled_on
