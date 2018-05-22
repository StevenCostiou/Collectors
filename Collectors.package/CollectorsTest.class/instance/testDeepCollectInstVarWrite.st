deep collection
testDeepCollectInstVarWrite

	| col items|	
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	col deepInstall.
	AnObjectWithInstVar new aMethodWithTempVar.
	
	items := col deepCollectedItems values first.
	
	self assert: items size equals: 4.
	self assert: items first node isGlobal.
	self assert: items first node parent == items second node.
	self assert: items second node parent == items last node.
	self assert: items third node parent == items last node.

	self assert: items third oldValue isNil.
	self assert: items third newValue == items last collectedObject