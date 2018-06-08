converting
asResistance
	^ [ | v |
	v := self computeOutputVoltageFrom: rawValue.
	self computeResistanceFrom: v ]
		on: Error
		do: [:err|  self log: err. 0 ]