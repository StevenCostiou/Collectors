replay
testReplayCancel
	| node col object items val newVal replayVal |
	node := (AnObjectWithInstVar >> #aMethodWithReplay) ast statements first value.
	col := Collector collectValue: node.
	
	object := AnObjectWithInstVar new.
	val := object aMethodWithReplay.
	newVal := object aMethodWithReplay.
	
	items := col omniscientCollectedItems first backInTimeItems.
	col replayCollectedItem: items first.
	
	self assert: col omniscientCollectedItems size equals: 2.
	
	col turnOffReplay.
	
	replayVal := object aMethodWithReplay.
	
	self deny: newVal equals: val.
	self deny: replayVal equals: val.
	self deny: replayVal equals: newVal.
	
	self assert: col omniscientCollectedItems size equals: 3.
	self assert: col omniscientCollectedItems first backInTimeItems size equals: 1.
	self assert: col omniscientCollectedItems first backInTimeItems first node parent == node