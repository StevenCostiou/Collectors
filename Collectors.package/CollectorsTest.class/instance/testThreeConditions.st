running
testThreeConditions
	| col config cond1 cond2 cond3 |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	cond1 := CollectEvaluation new.
	cond1 source: 'name = #instVar'.
	cond2 := CollectEvaluation new.
	cond2 source: 'value = ''tata'''.
	cond3 := CollectEvaluation new.
	cond3 source: 'class = AnObjectWithInstVar'.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #class).
	config conditions add: cond1; add: cond2; add: cond3.
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	AnObjectWithInstVar new instVar: 'tata'.
	AnObjectWithInstVar new instVar: 'titi'.
	self assert: col omniscientCollectedItems size equals: 1.
	self assert: col omniscientCollectedItems first collectedObject equals: 'tata'