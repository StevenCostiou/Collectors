updating
updateCollectorList
	collectors ifNotNil: [ collectors removeAll ].
	collectors ifNil: [ collectors := OrderedCollection new ].
	collectors addAll: Collector allInstances