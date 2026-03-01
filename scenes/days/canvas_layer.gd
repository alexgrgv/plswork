# day 1 gui

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

var orderList1 = [121, 312, 111, 322, 400, 400, 400, 400, 400]

var dateEnd: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	print("it is tuesday")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass
	

# add Noise
func _on_noise_button_pressed() -> void:
	show_sauce($Noise, 30)

# add Gravey
func _on_gravey_button_pressed() -> void:
	show_sauce($Gravey, 20)

# add Ink
func _on_ink_button_pressed() -> void:
	show_sauce($Ink, 10)

# add Missing
func _on_missing_button_pressed() -> void:
	show_ingredient($Missing, 3)

# add Onions
func _on_onions_button_pressed() -> void:
	show_ingredient($Onions, 2)

# add Cheese curds
func _on_curd_button_pressed() -> void:
	show_ingredient($Curd, 1)

# add Octo fries
func _on_octo_button_pressed() -> void:
	show_fry($Octo, 300)

# add Fries
func _on_fries_button_pressed() -> void:
	show_fry($Fries, 200)

# add Curley fries
func _on_curley_button_pressed() -> void:
	show_fry($Curley, 100)

# Send Order Bell 
func _on_bell_button_pressed() -> void:
	remove_food()
	
	if orderCode == orderList1[currentCharacter]:
		print("correct!")
	else:
		print("wrong.")	
	
	if currentCharacter == 0:
		$Character.visible = false
		$FoodSpeech1.visible = false
		$Character2.visible = true
		$FoodSpeech2.visible = true
		
	elif currentCharacter == 1:
		$Character2.visible = false
		$FoodSpeech2.visible = false
		$Character3.visible = true
		$FoodSpeech3.visible = true
		
	elif currentCharacter == 2:
		$Character3.visible = false
		$FoodSpeech3.visible = false
		$Character4.visible = true
		$FoodSpeech4.visible = true
		
	elif currentCharacter == 3:
		$Character4.visible = false
		$FoodSpeech4.visible = false
		# insert transition to next scene ! ! ! ! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		pass
	
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

# Make everything disappear
func remove_food() -> void:
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


# adding more later...
func checkOrder(order: int, intended: int):
	
	print(5)
