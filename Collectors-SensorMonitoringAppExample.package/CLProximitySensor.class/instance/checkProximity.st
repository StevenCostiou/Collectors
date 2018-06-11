initialization
checkProximity
	^ self read asNumber < 900
		ifTrue: [ 0 ]
		ifFalse: [ 1 ]