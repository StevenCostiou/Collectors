deep collection
testDeepCollectReceiver
	| col node items |
	node := (AnObjectWithInstVar >> #aMethodWithReceiver) ast statements first.
	col := Collector collectReceiver: node.	
	col installer install.	

	AnObjectWithInstVar new aMethodWithReceiver.	
	
	items := col omniscientCollectedItems first backInTimeItems.
	
	self assert: items first node isMessage.
	self assert: items last node isMessage.
	
	self assert: items last node receiver == items first node.
	self assert: node receiver == items last node.
	
	self assert: col omniscientCollectedItems first receiver == items last collectedObject.	
	self assert: items first collectedObject squared = items last collectedObject.
	

