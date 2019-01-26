deep collection
testDeepCollectInstVarWrite
	| col items |
	col := Collector collectInstVarNamed: 'instVar2' inClass: AnObjectWithInstVar.
	col configuration
		addReifications: #(#newValue).
	col reinstall.
	AnObjectWithInstVar new aMethodWithTempVar.
	items := (col omniscientCollectedItems collect:[:item| item backInTimeItems]) removeFirst; flattened.
	
	self assert: col omniscientCollectedItems size equals: 11.	
	self assert: (items first oldValue includes: 1).
	self assert: items first newValue equals: 1.
	self assert: (items first sourceObject includes: 1).
	
	2 to: items size - 1 do: [ :i | 
		self assert: ((items at: i) sourceObject includes: i).
		self assert: (items at: i) newValue equals: i.
		self assert: (items at: i) sourceObject == (items at: i + 1) sourceObject ].
	self assert: items last newValue equals: 10.
	self assert: (items last sourceObject includes: 10)