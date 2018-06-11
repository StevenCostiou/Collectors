computing
computeResistanceFrom: voltage
	| v r |
	"Constants"
	v := 3.3.
	r := 1000.
	^ r * (1 / (v / voltage - 1))
