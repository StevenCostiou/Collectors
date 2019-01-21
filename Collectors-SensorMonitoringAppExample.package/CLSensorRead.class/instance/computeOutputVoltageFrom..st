computing
computeOutputVoltageFrom: analogValue
	| maxAnalogValue v |
	"Constants"
	v := 3.3.
	maxAnalogValue := 1023.
	^ analogValue / maxAnalogValue * v