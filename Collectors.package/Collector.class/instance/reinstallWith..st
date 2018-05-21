installing
reinstallWith: aCollectorConfiguration
	aCollectorConfiguration reifications isEmpty
		ifTrue: [ self reinstallWeakWith: aCollectorConfiguration.
			^ self ].
	self configuration: aCollectorConfiguration.
	self beOmniscient.
	self addReifications: configuration reifications.
	configuration compileConditionsWith: installer reifications.
	configuration compileTransformationsWith: installer reifications.
	installer reinstall