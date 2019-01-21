collecting objects
basicCollectObject: anObject	
	(self collectedObjects anySatisfy: [ :o | o == anObject ])
		ifTrue: [ ^ self ].
	self collectedObjects add: anObject.
	self addCollectedClass: anObject class.
	collectAction ifNotNil: [ :block | block value: anObject ]