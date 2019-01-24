copying
copyContext: aContext
	aContext ifNil:[^context := nil].
	context := (aContext stackOfSize: 20) copy "collect: [ :c | c sender: c sender copy ]"