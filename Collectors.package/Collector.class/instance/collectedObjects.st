accessing
collectedObjects
	^ collectedObjects ifNil: [ collectedObjects := WeakOrderedCollection new: 10000000]