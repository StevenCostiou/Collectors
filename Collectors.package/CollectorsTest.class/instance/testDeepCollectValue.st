deep collection
testDeepCollectValue
	| node col items |
	node := (AnObjectWithInstVar >> #aMethodWithTempVar) ast statements second.
	col := Collector collectValue: node.
	
	AnObjectWithInstVar new aMethodWithTempVar.
	
	items := col omniscientCollectedItems first backInTimeItems.
	
	self assert: items first node isMessage.
	self assert: items second newValue == items first collectedObject.
	self assert: items second oldValue equals: -1.
	self assert: items second node isVariable.
	self assert: items first node == node value.
	self assert: items last node == node variable.
	self assert: col omniscientCollectedItems first collectedObject == items last newValue