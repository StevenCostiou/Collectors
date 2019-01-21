running
testNoTransformation
	| col config |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #object).
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems first transformations isEmpty.
	self assert: col omniscientCollectedItems second transformations isEmpty.
	self assert: col omniscientCollectedItems third transformations isEmpty