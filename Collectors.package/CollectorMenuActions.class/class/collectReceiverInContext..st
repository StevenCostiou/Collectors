actions
collectReceiverInContext: aClySugsMethodContext
	| nodes node collector|
	"remote ifNotNil: [ ^ remote collectReceiverInContext: aClySugsMethodContext forScope: aScope]."
	nodes := SugsMenuBuilder findBestNodeIntervalFor: aClySugsMethodContext.
	nodes first == nodes last
		ifFalse: [ ^ self inform: 'Unable to find the object: selection may be too large' ].
	node := nodes first.
	node isMessage
		ifFalse: [ ^ self inform: 'Selection does not refer to a message' ].
	collector := Collector collectReceiver: node.
	CollectorConfigurationEditor newForCollector: collector