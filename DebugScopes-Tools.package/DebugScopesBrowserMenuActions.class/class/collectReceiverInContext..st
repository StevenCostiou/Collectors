menu-collectors
collectReceiverInContext: aClySugsMethodContext
	| nodes node |
	remote ifNotNil: [ ^ remote collectReceiverInContext: aClySugsMethodContext ].
	nodes := SugsMenuBuilder findBestNodeIntervalFor: aClySugsMethodContext.
	nodes first == nodes last
		ifFalse: [ ^ self inform: 'Unable to find the object: selection may be too large' ].
	node := nodes first.
	node isMessage
		ifFalse: [ ^ self inform: 'Selection does not refer to a message' ].
	Collector collectReceiversOfNode: node