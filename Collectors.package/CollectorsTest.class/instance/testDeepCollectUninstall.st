deep collection
testDeepCollectUninstall
	| node col  |
	node := (AnObjectWithInstVar >> #aMethodWithTempVar) ast statements second.
	col := Collector collectValue: node.
	col installer install.	
	
	self assert: node links size equals: 1.
	self assert: node links first class == CollectorMetaLink.	
	self assert: (node allChildren removeFirst; collect: [ :n | n links ]) flattened size equals: 2.
	self assert: ((node allChildren removeFirst; collect: [ :n | n links ]) flattened allSatisfy: [ :link | link isNil or:[link class == MetaLink ]]).
	
	col uninstall.
	self assert: node links isEmpty.
	self assert: (node allChildren allSatisfy: [ :n | n links isEmpty ])