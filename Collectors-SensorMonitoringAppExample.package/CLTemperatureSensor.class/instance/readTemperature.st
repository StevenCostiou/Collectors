initialization
readTemperature
	| beta R25 T25 temperature |
	beta := -3720.
	R25 := 1000.
	T25 := 298.
	temperature := 1 / ((self resistance / R25) ln / beta + (1 / T25)).
	^ temperature - 273 roundDownTo: 0.005