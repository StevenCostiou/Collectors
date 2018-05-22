collecting
collect: anArrayOfReifications
	| collector object |
	collector := anArrayOfReifications first.
	object := anArrayOfReifications second.
	(collector mustCollect: anArrayOfReifications)
		ifFalse: [ ^ self ].
	collector collectObject: object.
	collector isOmniscient
		ifFalse: [ ^ self ].
	self omniscientCollect: object in: collector withReifications: anArrayOfReifications