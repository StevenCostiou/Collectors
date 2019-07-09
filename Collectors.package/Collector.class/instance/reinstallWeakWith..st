installing
reinstallWeakWith: aCollectorConfiguration
	self isOmniscient: false.
	installer resetReifications.
	self configuration: aCollectorConfiguration.
	self addReifications: configuration reifications.
	configuration compileConditionsWith: installer reifications.
	configuration compileTransformationsWith: installer reifications.
	optimizedCondition := configuration conditions isEmpty ifTrue:[CollectEvaluation new] ifFalse:[configuration conditions first].
	optimizedAction := configuration transformations isEmpty ifTrue:[CollectEvaluation new] ifFalse:[configuration transformations first].
	installer reinstall