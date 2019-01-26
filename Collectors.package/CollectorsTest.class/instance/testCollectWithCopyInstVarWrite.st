storage - strategies
testCollectWithCopyInstVarWrite
	| col items |
	self skip.
	col := Collector collectInstVarNamed: 'instVar2' inClass: AnObjectWithInstVar.
	col configuration
		addReifications: #(#newValue).
	col reinstall.
	AnObjectWithInstVar new aMethodWithTempVar.
	"items := (col omniscientCollectedItems collect:[:item| item backInTimeItems]) removeFirst; flattened.
	"
	items :=  col omniscientCollectedItems.
	self assert: items size equals: 11.	
"	self assert: items first oldValue isEmpty.
	self assert: items first newValue equals: 1."
	self assert: (items first sourceObject includes: 1).
	
	2 to: items size - 1 do: [ :i | 
		self deny: ((items at: i) oldValue includes: i).
		self deny: ((items at: i) collectedObject includes: i).
		self assert: ((items at: i)  sourceObject includes: i).
		self assert: (items at: i) newValue equals: i.
		self assert: (items at: i) sourceObject == (items at: i + 1) sourceObject ].
	self deny: (items last oldValue includes: 10).
	self deny: (items last collectedObject includes: 10).
	self assert: items last newValue equals: 10.
	self assert: (items last sourceObject includes: 10)