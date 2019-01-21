building
buildSubExpressionMorphFor: expressionSource changeDetected: hasChanged
	| morphs sourceMorph |
	morphs := OrderedCollection new.
	sourceMorph := (' ' , expressionSource) asStringMorph.
	morphs add: sourceMorph.
	hasChanged
		ifTrue: [ sourceMorph color: Color red muchDarker ].
	^ Smalltalk ui theme newColumnIn: World for: morphs