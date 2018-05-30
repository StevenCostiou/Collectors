printing
printOn: aStream
	self name isNotNil
		ifFalse: [ super printOn: aStream ]
		ifTrue: [ aStream nextPutAll: self name ]