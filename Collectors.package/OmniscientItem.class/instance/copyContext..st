copying
copyContext: aContext
	aContext ifNil:[^context := nil].
	context := (self context stackOfSize: 20) copy