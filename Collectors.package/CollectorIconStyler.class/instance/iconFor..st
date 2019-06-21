testing
iconFor: aNode
	(self replayLinkFor: aNode) ifNotNil: [ ^ self iconNamed: #smallUpdate ].
	^ ObjectMinersIcons minersMenuIcon  