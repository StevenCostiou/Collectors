scoping
forObject: anObject
	anObject ifNil:[^self].
	totalCollectedObjects := 0.
	self weakObject: anObject.
	link metaObject: self collectActionForObject.
	link selector: self selector.
	link arguments: self arguments.
	link invalidate
	