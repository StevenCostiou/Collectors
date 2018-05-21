installing
reinstallWeakWith: aCollectorConfiguration
	self isOmniscient: false.
	installer resetReifications.
	self configuration: aCollectorConfiguration.
	configuration compileConditionsWith: installer reifications.
	installer reinstall