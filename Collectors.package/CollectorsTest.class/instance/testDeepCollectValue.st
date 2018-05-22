deep collection
testDeepCollectValue
	| node col items |
	node := (AnObjectWithInstVar >> #aMethodWithTempVar) ast statements second.
	col := Collector collectValue: node.	
	col deepInstall.
	AnObjectWithInstVar new aMethodWithTempVar.
	items := col deepCollectedItems values first.
	
	self assert: items first node isMessage.
	self assert: items second newValue == items first collectedObject.
	self assert: items second oldValue equals: -1.
	self assert: items last collectedObject == items second newValue.
	