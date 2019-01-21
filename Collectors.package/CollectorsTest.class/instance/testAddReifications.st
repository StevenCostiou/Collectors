running
testAddReifications
	| col |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	col addReifications: #(#name #node #object).
	self assert: (col installer reifications includes: #name).
	self assert: (col installer reifications includes: #node).
	self assert: (col installer reifications includes: #object)