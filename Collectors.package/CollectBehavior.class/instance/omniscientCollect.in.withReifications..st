collecting
omniscientCollect: anObject in: aCollector withReifications: anArrayOfReifications
	| item  |
"	sortedReifications := self
		sortReifications: anArrayOfReifications
		with: aCollector reifications."
	item := OmniscientItem new.
	item rawData: anArrayOfReifications.
	item reificationSpec: aCollector reifications.
	aCollector applyTransformationsTo: item from: anArrayOfReifications.
	aCollector omniscientCollectItem: item