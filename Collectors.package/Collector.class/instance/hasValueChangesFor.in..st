testing
hasValueChangesFor: anItem in: items
	| index start stop |
	index := items identityIndexOf: anItem.
	index = 1
		ifTrue: [ ^ false ].
	start := index = 0
		ifTrue: [ items size ]
		ifFalse: [ index - 1 ].
	stop := 1.
	start to: stop by: -1 do: [ :i | 
		| item |
		item := items at: i.
		(item sourceObject == anItem sourceObject
			and: [ item collectedObject ~= anItem collectedObject ])
			ifTrue: [ ^ true ] ].
	^ false