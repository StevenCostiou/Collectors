deprecated
forObject
	self flag: 'Deprecated'.
"	behavior := [ :value :context | 
	context receiver == self weakObject
		ifTrue: [ collector collectObject: value ] ].
	self initializeLink"