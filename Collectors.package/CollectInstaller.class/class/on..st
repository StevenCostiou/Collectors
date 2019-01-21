instance creation
on: aCollector
	| installer |
	installer := self basicNew.
	installer collectorNode: (RFLiteralVariableNode value: aCollector).
	installer initialize.
	^ installer