running
testNoCondition
	| col config |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #object).
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems size equals: 3.
	self assert: col omniscientCollectedItems second collectedObject equals: 'tata'