accessing
newValue
	^ (self reificationNamed: #newValue) ifNil:[self collectedObject]