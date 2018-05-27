testing
iconLabel: aNode
	(self replayLinkFor: aNode) ifNotNil: [ :link | ^ 'Replay value: ' , link metaObject printString ].
	^ 'History'