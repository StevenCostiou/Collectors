deep collection
testDeepCollectInstVarWrite
	| col items |
	col := Collector collectInstVarNamed: 'instVar2' inClass: AnObjectWithInstVar.
	AnObjectWithInstVar new aMethodWithTempVar.
	items := (col omniscientCollectedItems collect:[:item| item backInTimeItems]) removeFirst; flattened.
	
	self assert: col omniscientCollectedItems size equals: 11.	
	self assert: items first oldValue isEmpty.
	self assert: items first newValue equals: 1.
	self assert: (items first collectedObject includes: 1).
	
	2 to: items size - 1 do: [ :i | 
		self deny: ((items at: i) oldValue includes: i).
		self assert: ((items at: i) collectedObject includes: i).
		self assert: (items at: i) newValue equals: i.
		self assert: (items at: i) collectedObject == (items at: i + 1) collectedObject ].
	self deny: (items last oldValue includes: 10).
	self assert: items last newValue equals: 10.
	self assert: (items last collectedObject includes: 10)