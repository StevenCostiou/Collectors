behavior
addReification: aReification
	(self reifications includes: aReification)
		ifFalse: [ self reifications add: aReification ]