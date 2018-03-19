scoping
changeCondition: aBlock
	| copyBlock |
	copyBlock := aBlock copy.
	copyBlock numArgs < self arguments size
		ifTrue: [ | missingArgs |
			missingArgs := self arguments copyFrom: copyBlock numArgs + 1 to: self arguments size.
			copyBlock := copyBlock copyAndAddArgumentsNamed: missingArgs ].
	link condition: copyBlock arguments: self arguments