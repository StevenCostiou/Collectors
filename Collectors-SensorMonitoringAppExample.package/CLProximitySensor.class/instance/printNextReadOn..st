printing
printNextReadOn: aStream
	self checkProximity = 0
		ifTrue: [ ^ self ].
	aStream cr.
	aStream nextPutAll: 'PROXIMITY WARNING'