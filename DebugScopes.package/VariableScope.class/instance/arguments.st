installing - options
arguments
	self weakObject ifNotNil: [ ^ self argumentsForObject ].
	scopeType = self receiverScopeType
		ifTrue: [ ^ #(receiver) ].
	^ #(newValue)