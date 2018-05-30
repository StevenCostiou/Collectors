api
testAddConditionBlockWithReifications
	| col |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	col
		addConditionBlock: [ :name :class | name = 'instVar' and: [ class = AnObjectWithInstVar ] ]
		withReifications: #(#name #class).
	col reinstall.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems size equals: 3