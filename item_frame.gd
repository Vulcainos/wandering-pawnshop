class_name Cadre extends Control


var item: Item = Item.new();
var falsePrice: int;
var isBuy: bool = false;
signal itemBuy;
signal itemSell;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setItem(newItem: Item):
	item = Item.new()
	item.disable = true;
	item.setItem(newItem);
	isBuy= true;
	$ItemSprite.texture = load(item.imageUID)

func getRandomItem():
	item.getRandomItem();
	$ItemSprite.texture = load(item.imageUID)
	getRandomPrice();
	$CadreTextureButton.disabled = false;
	item.disable = false;

func getRandomPrice():
	var min = item.price*0.8 as int;
	var max = item.price*1.2 as int;
	falsePrice = randi_range(min, max);
	print(min, " - " , max," - ", falsePrice)
	$PriceLabel.text = str(falsePrice);

func reset():
	item = null;
	$ItemSprite.texture = null;
	$PriceLabel.text = "";
	falsePrice = 0;

func _on_cadre_texture_button_pressed() -> void:
	if item == null or item.disable:
		return
	if isBuy and not item.disable:
		itemSell.emit();
		Balance.addBalance(falsePrice);
		reset()
		return
	if Balance.balance < falsePrice:
		return;
	item.disable = true;
	$PriceLabel.text = "";
	itemBuy.emit(item);
	Balance.remBalance(falsePrice)
	$CadreTextureButton.disabled = true;
	$ItemSprite.texture = null;


func canBeBuy():
	#print(item, item.itemName)
	if item == null or item.itemName == "":
		$PriceLabel.text = "";
		return
	getRandomPrice();
	item.disable = false;
	$CadreTextureButton.disabled = false;
	
