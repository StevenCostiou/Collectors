deep collection
testDeepCollectCascade
	| col node items |
		self flag:'If time fix this, until then no collectors on cascade node'.
	self skip.
	node := (AnObjectWithInstVar >> #aMethodWithCascade) ast statements first messages last.

	col := Collector collectValue: node.
	AnObjectWithInstVar new aMethodWithCascade.
	
	items := col omniscientCollectedItems first backInTimeItems.
	self assert: items first node isMessage.
	self assert: items last node isMessage.
	self assert: items last node receiver == items first node.
	self assert: node receiver == items last node.
	self assert: col omniscientCollectedItems first receiver == items last collectedObject.
	self assert: items first collectedObject squared = items last collectedObject