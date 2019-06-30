collecting - control
applyTransformationsTo: item from: reifications
	| transformation |
	configuration transformations isEmpty
		ifTrue: [ ^ self ].
	transformation := configuration transformation first.
	item transformations
		at: transformation first name
		put: (transformation evaluateWith: reifications)