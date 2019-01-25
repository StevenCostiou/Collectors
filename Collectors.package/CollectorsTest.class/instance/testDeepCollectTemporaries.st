deep collection
testDeepCollectTemporaries
	| node col items |
	node := (AnObjectWithInstVar >> #aMethodWithTempVar) ast statements second.
	col := Collector collectValue: node.	
	col configuration
		addReifications: (node availableReifications select:[:r|
		 	(#(#operation) includes: r) not]).
	col reinstall.  

	AnObjectWithInstVar new aMethodWithTempVar.
		
	self assert: col omniscientCollectedItems size equals: 1.
	
	items := col omniscientCollectedItems first backInTimeItems.
	
	self assert: items size equals: 2.
	self assert: items first node isMessage.
	self assert: items first node parent == node.
	self assert: items second node parent == node.

	self assert: items second oldValue equals: -1.
	self assert: items first node == node value.
	self assert: items second node == node variable.
	self assert: col omniscientCollectedItems first collectedObject == items last collectedObject