extends Node

var balance: int = 50;
signal balanceChange;

func addBalance(add: int) -> int:
	balance += add;
	balanceChange.emit()
	return balance
func remBalance(add: int) -> int:
	balance -= add;
	balanceChange.emit()
	return balance
