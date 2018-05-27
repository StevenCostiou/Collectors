testing
replayLinkFor: aNode
	aNode links ifNil: [ ^ nil ].
	^ aNode links detect: [ :link | link class == CollectorMetaLink and: [ link isReplay ] ] ifNone: [ nil ]