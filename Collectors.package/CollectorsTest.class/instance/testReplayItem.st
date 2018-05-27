replay
testReplayItem
	| node col object items val newVal replayVal |
	node := (AnObjectWithInstVar >> #aMethodWithReplay) ast statements first value.
	col := Collector collectValue: node.
	
	object := AnObjectWithInstVar new.
	val := object aMethodWithReplay.
	newVal := object aMethodWithReplay.
	
	items := col omniscientCollectedItems first backInTimeItems.
	col replayCollectedItem: items first.
	
	self assert: col omniscientCollectedItems size equals: 2.
	
	replayVal := object aMethodWithReplay.
	
	self assert: col omniscientCollectedItems size equals: 2.
	self deny: newVal equals: val.
	self assert: replayVal equals: val