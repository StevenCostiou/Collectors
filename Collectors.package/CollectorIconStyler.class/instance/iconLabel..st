testing
iconLabel: aNode
	(self replayLinkFor: aNode) ifNotNil: [ :link | ^ 'Replay value: ' , link metaObject replayValue printString ].
	^ aNode collector hasCollectedItems
		ifTrue: [ 'History: ' , aNode collector omniscientCollectedItems size printString ]
		ifFalse: [ 'No History' ]