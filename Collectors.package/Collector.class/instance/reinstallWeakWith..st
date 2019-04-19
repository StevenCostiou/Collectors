installing
reinstallWeakWith: aCollectorConfiguration
	self isOmniscient: false.
	installer resetReifications.
	self configuration: aCollectorConfiguration.
	self addReifications: configuration reifications.
	configuration compileConditionsWith: installer reifications.
	configuration compileTransformationsWith: installer reifications.
	installer reinstall