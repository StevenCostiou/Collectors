testing
iconFor: aNode
	(self replayLinkFor: aNode) ifNotNil: [ ^ self iconNamed: #smallUpdate ].
	^ aNode collector hasCollectedItems
		ifTrue: [ self iconNamed: #history ]
		ifFalse: [ super iconFor: aNode ]