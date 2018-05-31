actions
collectResultInContext: aClySugsMethodContext
	| nodes node collector |
	"remote
		ifNotNil: [ ^ remote collectResultInContext: aClySugsMethodContext forScope: aScope ]."
	nodes := SugsMenuBuilder findBestNodeIntervalFor: aClySugsMethodContext.
	node := nodes first == nodes last
		ifTrue: [ nodes first ]
		ifFalse: [ nodes first parent == nodes last parent
				ifTrue: [ nodes first parent ]
				ifFalse: [ ^ self inform: 'Unable to find the object: selection may be too large' ] ].
	collector := Collector collectValue: node.
	CollectorConfigurationEditor new
		title: 'Configuration';
		collector: collector;
		openOn: #()