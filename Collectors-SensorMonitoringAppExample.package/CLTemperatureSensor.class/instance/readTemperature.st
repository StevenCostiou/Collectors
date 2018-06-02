initialization
readTemperature

	| analogValue maxAnalogValue beta V R R25 T25 outputV Rcomputed temperature |
	"Constants"
	V := 3.3.
	R := 1000.
	beta := -3720.
	R25 := 1000.
	T25 := 298.
	maxAnalogValue := 1023.
	
	"Input value"
	analogValue := self read asNumber.
	
	"Computed values"
	outputV := ((analogValue / maxAnalogValue) * V).
	Rcomputed := R * (1 / ((V/outputV) - 1)).		
			
	"Computed temperature"
	temperature := 1 / ((Rcomputed / R25) ln / beta + (1 / T25)).
	^ (temperature - 273) roundDownTo: 0.01