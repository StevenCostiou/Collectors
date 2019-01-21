compiling
compileConditionsWith: reificationsNames
	conditions ifEmpty: [ ^ self ].
	conditions do: [ :cond | cond compileWith: reificationsNames ]