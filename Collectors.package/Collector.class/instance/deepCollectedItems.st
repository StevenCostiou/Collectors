accessing
deepCollectedItems
	^ deepCollectedItems ifNil: [ deepCollectedItems := OrderedCollection new ]