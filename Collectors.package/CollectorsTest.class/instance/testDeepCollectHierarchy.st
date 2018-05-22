deep collection
testDeepCollectHierarchy
	| node col items |
	node := (AnObjectWithInstVar >> #aMethodWithTempVar) ast statements second.
	col := Collector collectValue: node.	
	col deepInstall.
	AnObjectWithInstVar new aMethodWithTempVar.
	
	self assert: col deepCollectedItems size equals: 1.
	
	items := col deepCollectedItems values first.
	
	self assert: items size equals: 3.
	self assert: items first node parent == items last node.
	self assert: items second node parent == items last node.
	self assert: items last node == node.
	