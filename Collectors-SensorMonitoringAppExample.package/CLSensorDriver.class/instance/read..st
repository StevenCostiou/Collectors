read/write
read: chan
	chan = 2
		ifTrue: [ 200 atRandom < 2
				ifTrue: [ ^ 'nan' ].
			^ (775 to: 800) atRandom ].
	200 atRandom < 20
		ifTrue: [ ^ 0 ].
	chan = 4
		ifTrue: [ ^ (650 to: 655) atRandom ].
	chan = 1
		ifTrue: [ ^ (200 to: 250) atRandom ].
	^ (0 to: 1023) atRandom