running
testCollectItems
	| col config|
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #node #object).
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems size equals: 3