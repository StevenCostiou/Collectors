testing
iconFor: aNode
	(self replayLinkFor: aNode) ifNotNil: [ ^ self iconNamed: #smallUpdate ].
	^ self iconNamed: #history