extends Node2D

#1152

var tween : Tween;
signal isHere;
signal nouveauSaler;

func _ready() -> void:
	$ListeSprite.position = Vector2(1252, 0)

func arrive():
	#print("testtestest")
	#tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR).set_parallel(true)
	#tween.tween_property($ListeSprite, "position", Vector2(0, 0), 1.0)
	#print("testtestzéééest")
	#await tween.finished;
	#print("fin")
	#tween.stop()
	#tween.kill()
	
	$AnimationPlayer.play("Arrive");
	await $AnimationPlayer.animation_finished;
	isHere.emit();
func repart():
	#tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR).set_parallel(true)
	#$ListeSprite.position = Vector2(0, 0)
	#tween.tween_property($ListeSprite, "position", Vector2(-1252, 0), 1.0)
	#tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR).tween_property($ListeSprite, "position", Vector2(-1252,0), 10.0);
	#await tween.finished;
	#tween.stop()
	
	
	$AnimationPlayer.play("depart");
	await $AnimationPlayer.animation_finished;
	reset();
	
func reset():
	#position.x = 1252;
	var spriteNumber = randi()%3;
	$ListeSprite/Sprite2D.visible = false;
	$ListeSprite/Sprite2D2.visible = false;
	$ListeSprite/Sprite2D3.visible = false;
	if spriteNumber == 0:
		$ListeSprite/Sprite2D.visible = true;
	if spriteNumber == 1:
		$ListeSprite/Sprite2D2.visible = true;
	if spriteNumber == 2:
		$ListeSprite/Sprite2D3.visible = true;
	
	nouveauSaler.emit();
	
	arrive()
	
	
