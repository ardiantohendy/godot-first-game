extends Control

@onready var coin_label = $CoinLabel # Ambil Label untuk Koin
var coin_count = 0
	
func add_coin():
	coin_count += 1
	coin_label.text = "= " + str(coin_count)
	print("Current Coin: ", coin_count)
	
func coin_total():
	print("Coin Total: ", coin_count)
	
