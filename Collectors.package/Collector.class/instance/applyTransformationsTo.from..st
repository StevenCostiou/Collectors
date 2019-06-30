collecting - control
applyTransformationsTo: item from: reifications
	| transformation |
	configuration transformations isEmpty
		ifTrue: [ ^ self ].
	transformation := configuration transformations first.
	item transformations
		at: transformation name
		put: (transformation evaluateWith: reifications)