replay
testReplayDisablesCollection
	| node col object items val replayVal |
	node := (AnObjectWithInstVar >> #aMethodWithReplay) ast statements first.
	col := Collector collectValue: node.
	
	object := AnObjectWithInstVar new.
	val := object aMethodWithReplay.
	
	items := col omniscientCollectedItems first backInTimeItems.
	
	self assert: col omniscientCollectedItems size equals: 1.	
	self assert: items size equals: 3.
	
	col replayCollectedItem: items first.
	replayVal := object aMethodWithReplay.
	
	self assert: col omniscientCollectedItems size equals: 1.	
	self assert: items size equals: 3.	
	self assert: replayVal equals: val