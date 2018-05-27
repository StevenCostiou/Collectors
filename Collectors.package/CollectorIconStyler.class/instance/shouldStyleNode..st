testing
shouldStyleNode: aNode
	^ (self replayLinkFor: aNode) notNil or: [ aNode hasCollector and: [ aNode collector hasCollectedItems ] ]