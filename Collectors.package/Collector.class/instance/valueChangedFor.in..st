testing
valueChangedFor: anItem in: items
	| index previousIndex previousItem |
	items size <= 1 ifTrue:[^false].
	index := items identityIndexOf: anItem.
	index = 1
		ifTrue: [ ^ false ].
	previousIndex := index = 0
		ifTrue: [ items size ]
		ifFalse: [ index - 1 ].
	previousItem := items at: previousIndex.
	^ [ self diffBlock
		value: anItem collectedObject
		value: previousItem collectedObject ]
		on: Error
		do: [ false ]