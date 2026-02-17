class_name Item extends Node

var itemName: String;
var imageUID: String = "uid://c5wiwrjtj37ti";
var disable: bool = false;
var price:int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setItem(newItem: Item):
	itemName = newItem.itemName;
	imageUID = newItem.imageUID;
	price = newItem.price

func getRandomItem():
	var randomItem = randi()%8;
	if randomItem == 0:
		itemName = "Epee";
		imageUID = "uid://c5wiwrjtj37ti";
		price = 60
	if randomItem == 1:
		itemName = "Livre";
		imageUID = "uid://c6exlimhaxvxh";
		price = 40
	if randomItem == 2:
		itemName = "Armure";
		imageUID = "uid://cims0bgxejfkm";
		price = 80
	if randomItem == 3:
		itemName = "BouleRouge";
		imageUID = "uid://n27e28fn0xuo";
		price = 60
	if randomItem == 4:
		itemName = "Lingot";
		imageUID = "uid://cbbu6mveuiwn";
		price = 120
	if randomItem == 5:
		itemName = "PotionBleu";
		imageUID = "uid://c2lracua028h8";
		price = 90
	if randomItem == 6:
		itemName = "Torche";
		imageUID = "uid://crcu7jew7wyf2";
		price = 20
	if randomItem == 7:
		itemName = "potionVert";
		imageUID = "uid://bt7bvk1hjlcu3";
		price = 30
	
	
