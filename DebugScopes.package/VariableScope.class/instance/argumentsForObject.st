installing - options
argumentsForObject
	scopeType = self receiverScopeType
		ifTrue: [ ^ #(receiver context) ].
	^ #(newValue context)