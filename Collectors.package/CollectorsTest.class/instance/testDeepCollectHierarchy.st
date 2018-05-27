deep collection
testDeepCollectHierarchy
	| node col items |
	node := (AnObjectWithInstVar >> #aMethodWithTempVar) ast statements second.
	col := Collector collectValue: node.	
	
	AnObjectWithInstVar new aMethodWithTempVar.
	
	self assert: col omniscientCollectedItems size equals: 1.
	
	items := col omniscientCollectedItems first backInTimeItems.
	
	self assert: items size equals: 2.
	self assert: items first node parent == node.
	self assert: items first node == node value .
	self assert: items last node parent == node.
	self assert: items last node == node variable .
	