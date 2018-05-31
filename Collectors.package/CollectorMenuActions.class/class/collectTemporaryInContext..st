actions
collectTemporaryInContext: aClySugsMethodContext
	| nodes node collector |
	"remote ifNotNil: [ ^ remote collectTemporaryInContext: aClySugsMethodContext forScope: aScope]."
	nodes := SugsMenuBuilder findBestNodeIntervalFor: aClySugsMethodContext.
	nodes first == nodes last
		ifFalse: [ ^ self inform: 'Unable to find the object: selection may be too large' ].
	node := nodes first.
	(node isVariable and: [ node isTemp ])
		ifFalse: [ ^ self inform: 'Selection does not refer to a temporary variable' ].
	collector := Collector collectTempVarNamed: node name inMethodNamed: node methodNode selector inClass: node methodNode methodClass.
	CollectorConfigurationEditor new
		title: 'Configuration';
		collector: collector;
		openOn: #()