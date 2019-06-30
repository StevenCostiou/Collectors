accessing
collectedObjects
	^ collectedObjects ifNil: [ collectedObjects := WeakOrderedCollection new: 1000000]