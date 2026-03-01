# day 2 gui

extends CanvasLayer

var checkFries: bool = false
var currentFry: Node = null  # Curley, Fries, Octo
var fryValue: int = 0 # X

var checkSauce: bool = false
var currentSauce: Node = null # Ink, Gravey, "Noise"
var sauceValue: int = 0 # X0

var checkIngredient: bool = false
var currentIngredient: Node = null # Cheese Curds, Onions, "Missing"
var ingredientValue: int = 0 # X00

var orderCode: int = 0 # 3-digit number to determine order
var currentDate: int = 1 # date cgeck(?)
var currentCharacter: int = 0 # index for array to check character orders, 0 to 3 

var orderList2 = [131, 122, 323, 233]

var dateEnd: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	print("it is wednesday")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 
	# $MissingButton.visible = not visible
	# $NoiseButton.visible = not visible

# add Noise
func _on_texture_button_10_pressed() -> void:
	show_sauce($Noise, 30)

# add Gravey
func _on_texture_button_9_pressed() -> void:
	show_sauce($Gravey, 20)

# add Ink
func _on_texture_button_8_pressed() -> void:
	show_sauce($Ink, 10)

# add Missing
func _on_texture_button_7_pressed() -> void:
	show_ingredient($Missing, 3)

# add Onions
func _on_texture_button_6_pressed() -> void:
	show_ingredient($Onions, 2)

# add Cheese curds
func _on_texture_button_5_pressed() -> void:
	show_ingredient($Curd, 1)

# add Octo fries
func _on_texture_button_4_pressed() -> void:
	show_fry($Octo, 300)

# add Fries
func _on_texture_button_3_pressed() -> void:
	show_fry($Fries, 200)

# add Curley fries
func _on_texture_button_2_pressed() -> void:
	show_fry($Curley, 100)

# The Reset Bell 
func _on_texture_button_pressed() -> void:
	if (checkFries and checkSauce and checkIngredient):
		currentFry.visible = false
		checkFries = false
		currentFry = null
	
		currentIngredient.visible = false
		checkIngredient = false
		currentIngredient = null
	
		currentSauce.visible = false
		checkSauce = false
		currentSauce = null
	
		# code to check order goes here
		
		
		orderCode = 0 # reset
		currentCharacter += 1

# Make fries appear
func show_fry(fry_node: Node, value: int):
	if checkFries:
		return
	
	fry_node.visible = true
	checkFries = true
	currentFry = fry_node
	
	fryValue = value
	orderCode += fryValue
	print(orderCode)

# Make sauce appear
func show_sauce(sauce_node: Node, value: int):
	if checkSauce:
		return
	
	sauce_node.visible = true
	checkSauce = true
	currentSauce = sauce_node
	
	sauceValue = value
	orderCode += sauceValue
	print(orderCode)

# Make ingredients appear
func show_ingredient(ingredient_node: Node, value: int):
	if checkIngredient:
		return
	
	ingredient_node.visible = true
	checkIngredient = true
	currentIngredient = ingredient_node
	
	ingredientValue = value
	orderCode += ingredientValue
	print(orderCode)

# adding more later...
func checkOrder(order: int, intended: int):
	
	print(5)
