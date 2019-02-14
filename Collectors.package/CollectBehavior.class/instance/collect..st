collecting
collect: anArrayOfReifications
	| collector object |
	collector := anArrayOfReifications first.
	object := anArrayOfReifications second.

	((collector mustCollect: anArrayOfReifications) ifNil: [ false ])
		ifFalse: [ collector trashDeepCollectedItems.
			^ self ].
	self
		omniscientCollect: object
		in: collector
		withReifications: anArrayOfReifications