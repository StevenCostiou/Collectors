accessing
state: aBoolean
	aBoolean
		ifTrue: [ handler addReification: reification. ]
		ifFalse: [ handler removeReification: reification.
 ]