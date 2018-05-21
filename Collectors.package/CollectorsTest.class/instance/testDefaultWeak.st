running
testDefaultWeak
	| col |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	self deny: col isOmniscient