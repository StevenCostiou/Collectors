computing
computeResistanceFrom: voltage
	| v r |
	"Constants"
	voltage = 0
		ifTrue: [ ^ 0 ].
	v := 3.3.
	r := 1000.
	^ r * (1 / (v / voltage - 1))