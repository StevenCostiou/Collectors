running
testOneTransformation
	| col config transfo |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	transfo := CollectEvaluation new.
	transfo name: 'Yell name'.
	transfo source: 'value asUppercase'.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #object).
	config transformations add: transfo.
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: (col omniscientCollectedItems first transformations at: 'Yell name') equals: 'TOTO'.
	self assert: (col omniscientCollectedItems second transformations at: 'Yell name') equals: 'TATA'.
	self assert: (col omniscientCollectedItems third transformations at: 'Yell name') equals: 'TITI'