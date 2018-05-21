running
testThreeTransformations
	| col config transfo1 transfo2 transfo3 |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	transfo1 := CollectEvaluation new.
	transfo1 source: 'value asUppercase'.
	transfo2 := CollectEvaluation new.
	transfo2 source: 'name asString reverse'.
	transfo3 := CollectEvaluation new.
	transfo3 source: 'name asString reverse asUppercase'.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #class).
	config transformations
		add: transfo1;
		add: transfo2;
		add: transfo3.
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems first transformations first equals: 'TOTO'.
	self assert: col omniscientCollectedItems second transformations second equals: 'raVtsni'.
	self
		assert: col omniscientCollectedItems third transformations third
		equals: 'RAVTSNI'