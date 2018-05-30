api
testAddTransformationBlockWithReifications
	| col |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	col
		addTransformationBlock: [ :value | value asUppercase ]
		withReifications: #(#value).
	col reinstall.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems size equals: 3.
	self assert: col omniscientCollectedItems first transformations first equals: 'TOTO'.