compiling
compileTransformationsWith: reificationsNames
	transformations do: [ :transfo | transfo compileWith: reificationsNames ]