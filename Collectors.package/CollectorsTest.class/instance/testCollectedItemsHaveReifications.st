running
testCollectedItemsHaveReifications
	| col config |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #node #object).
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems first name equals: #instVar.
	self assert: col omniscientCollectedItems second collectedObject equals: 'tata'.
	self assert: (col omniscientCollectedItems third sourceObject isKindOf: AnObjectWithInstVar)