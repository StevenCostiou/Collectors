running
testDefaultWeak
	| col |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	col isOmniscient: false.
	self deny: col isOmniscient