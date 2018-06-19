compiling
compileTransformationsWith: reificationsNames
	transformations ifEmpty: [ ^ self ].
	transformations do: [ :transfo | transfo compileWith: reificationsNames ]