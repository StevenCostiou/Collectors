collecting
collect: anArrayOfReifications
	| collector object |
	collector := anArrayOfReifications first.
	object := anArrayOfReifications second.
	(collector mustCollect: anArrayOfReifications)
		ifFalse: [ collector trashDeepCollectedItems.
			^ nil ].
	self
		omniscientCollect: object
		in: collector
		withReifications: anArrayOfReifications