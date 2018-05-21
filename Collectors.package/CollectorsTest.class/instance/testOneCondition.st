running
testOneCondition
	| col config condition |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	condition := CollectEvaluation new.
	condition source: 'name = ''instVar'''.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #object).
	config conditions add: condition.
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems size equals: 3.
	self assert: col omniscientCollectedItems second collectedObject equals: 'tata'