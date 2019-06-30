behavior - collection
omniscientCollectItem: anItem
	self omniscientCollectedItems add: anItem.
	anItem backInTimeItems: deepCollectedItems.
	self isOmniscient ifFalse:[^self].
	self trashDeepCollectedItems.