instance creation
on: aCollector
	| installer |
	installer := self basicNew.
	installer collectorNode: (RBLiteralNode value: aCollector).
	installer initialize.
	^ installer