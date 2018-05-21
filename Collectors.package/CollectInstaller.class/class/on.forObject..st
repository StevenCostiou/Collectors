instance creation
on: aCollector forObject: anObject
	| installer |
	installer := self on: aCollector.
	installer weakObject: anObject.
	installer forObject.
	^ installer