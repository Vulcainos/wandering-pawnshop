extends Control

signal leaveShop;

var item1: Item;
var item2: Item;
var item3: Item;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	($HBoxContainer/SalerHBoxContainer2/ItemFrame as Cadre).itemBuy.connect(newItemBuy);
	($HBoxContainer/SalerHBoxContainer2/ItemFrame2 as Cadre).itemBuy.connect(newItemBuy);
	($HBoxContainer/SalerHBoxContainer2/ItemFrame3 as Cadre).itemBuy.connect(newItemBuy);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func newItemBuy(newItem: Item):
	#print(newItem)
	if item1 == null:
		item1 = newItem;
		$HBoxContainer/WanderHBoxContainer/ItemFrame.setItem(newItem)
	elif item2 == null:
		item2 = newItem;
		$HBoxContainer/WanderHBoxContainer/ItemFrame2.setItem(newItem)
	elif item3 == null:
		item3 = newItem;
		$HBoxContainer/WanderHBoxContainer/ItemFrame3.setItem(newItem)

func showShop():
	self.visible = true;
	for sellItems in $HBoxContainer/WanderHBoxContainer.get_children():
		(sellItems as Cadre).canBeBuy();


func newSaler():
	for frame in $HBoxContainer/SalerHBoxContainer2.get_children():
		(frame as Cadre).getRandomItem();

func _on_button_leave_pressed() -> void:
	self.visible = false;
	leaveShop.emit();


func _on_item_frame_item_sell() -> void:
	item1 = null;
	


func _on_item_frame_2_item_sell() -> void:
	item2 = null;


func _on_item_frame_3_item_sell() -> void:
	item3 = null;
