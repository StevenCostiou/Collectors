api
testApplyTransformationFromReifications
	| col config |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	config := CollectorConfiguration new.
	config transformations
		add:
			(CollectEvaluation new
				source: 'value asUppercase';
				name: 'Yell name').
	config reifications add: #value.
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems size equals: 3.
	self assert: (col omniscientCollectedItems first transformations at: 'Yell name') equals: 'TOTO'