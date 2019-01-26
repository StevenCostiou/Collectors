deep collection
testDeepCollectDenial
	| col items condition config |
	col := Collector
		collectInstVarNamed: 'instVar'
		inClass: AnObjectWithInstVar.
	condition := CollectEvaluation new.
	condition source: 'false'.
	config := CollectorConfiguration new.
	config conditions add: condition.
	col reinstallWith: config.
	AnObjectWithInstVar new aMethodWithTempVar.
	items := col deepCollectedItems.
	self assert: items isEmpty