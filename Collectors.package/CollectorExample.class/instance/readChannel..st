as yet unclassified
readChannel: chan
	chan = 0
		ifTrue: [ ^ nil ].
	^ (800 to: 1023) atRandom