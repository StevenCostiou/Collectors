read/write
read: chan
	chan = 4
		ifTrue: [ ^ 20 atRandom < 2
				ifTrue: [ 'nan' ]
				ifFalse: [ (650 to: 675) atRandom ] ].
	chan = 1
		ifTrue: [ ^ (200 to: 250) atRandom ].
	chan = 2
		ifTrue: [ ^ (775 to: 785) atRandom ].
	^ (0 to: 1023) atRandom