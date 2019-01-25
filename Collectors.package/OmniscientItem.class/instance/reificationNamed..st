private
reificationNamed: reificationSymbol
	| index |
	index := reificationSpec
		indexOf: reificationSymbol
		ifAbsent: [ ^ nil ].
	^ rawData at: index