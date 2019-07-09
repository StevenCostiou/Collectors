installing
reinstallWith: aCollectorConfiguration
	self isOmniscient
		ifFalse: [ ^ self reinstallWeakWith: aCollectorConfiguration ].
	self configuration: aCollectorConfiguration.
	installer resetReifications.
	self addReifications: configuration reifications.
	configuration compileConditionsWith: installer reifications.
	configuration compileTransformationsWith: installer reifications.	
	optimizedCondition := configuration conditions isEmpty ifTrue:[CollectNullEvaluation new] ifFalse:[configuration conditions first].
	optimizedAction := configuration transformations isEmpty ifTrue:[CollectNullEvaluation new] ifFalse:[configuration transformations first].
	installer reinstall