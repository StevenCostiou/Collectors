deep collection
testDeepCollectWithCondition
	| col items condition config |
	col := Collector collectInstVarNamed: 'instVar2' inClass: AnObjectWithInstVar.
	condition := CollectEvaluation new.
	condition source: 'true'.
	config := CollectorConfiguration new.
	config conditions add: condition.
	col reinstallWith: config.
	AnObjectWithInstVar new aMethodWithTempVar.
	items := col omniscientCollectedItems.
	self assert: items size equals: 11.
	self
		assert:
			((items collect: [ :item | item backInTimeItems ])
				removeFirst;
				flattened) size
		equals: 10