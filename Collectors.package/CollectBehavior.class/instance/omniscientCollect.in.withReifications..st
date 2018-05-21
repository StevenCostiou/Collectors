enumerating
omniscientCollect: anObject in: aCollector withReifications: anArrayOfReifications
	| item sortedReifications requestedReifications |
	sortedReifications := Dictionary new.
	requestedReifications := aCollector reifications.
	requestedReifications
		with: anArrayOfReifications
		collect: [ :argument :reification | sortedReifications at: argument put: reification ].
	item := OmniscientItem fromReifications: sortedReifications.
	aCollector applyTransformationsTo: item from: anArrayOfReifications.
	aCollector omniscientCollectItem: item