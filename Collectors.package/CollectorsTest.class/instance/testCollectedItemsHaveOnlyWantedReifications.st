running
testCollectedItemsHaveOnlyWantedReifications
	| col config |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	config := CollectorConfiguration new.
	config reifications addAll: #(#name #node #object).
	col reinstallWith: config.
	AnObjectWithInstVar new instVar: 'toto'.
	self assert: col omniscientCollectedItems first arguments isNil