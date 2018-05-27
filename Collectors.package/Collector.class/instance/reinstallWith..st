installing
reinstallWith: aCollectorConfiguration
	self isOmniscient
		ifFalse: [ self reinstallWeakWith: aCollectorConfiguration.
			^ self ].
	self configuration: aCollectorConfiguration.
	self addReifications: configuration reifications.
	configuration compileConditionsWith: installer reifications.
	configuration compileTransformationsWith: installer reifications.
	installer reinstall