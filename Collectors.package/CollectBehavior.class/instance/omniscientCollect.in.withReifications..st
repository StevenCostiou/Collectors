collecting
omniscientCollect: anObject in: aCollector withReifications: anArrayOfReifications
	| item sortedReifications |
	sortedReifications := self
		sortReifications: anArrayOfReifications
		with: aCollector reifications.
	item := OmniscientItem fromReifications: sortedReifications.
	aCollector applyTransformationsTo: item from: anArrayOfReifications.
	aCollector omniscientCollectItem: item