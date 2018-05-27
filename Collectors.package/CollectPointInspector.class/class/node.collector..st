as yet unclassified
node: aNode collector: aCollector
	| inspector |
	inspector := self basicNew.
	inspector
		node: aNode;
		collector: aNode collector.
	inspector title: aCollector printDefinition.
	inspector initialize.
	inspector openOn: #()