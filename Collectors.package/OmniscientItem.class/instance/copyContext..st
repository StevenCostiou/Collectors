copying
copyContext: aContext
	context := (aContext stackOfSize: 20) copy "collect: [ :c | c sender: c sender copy ]"