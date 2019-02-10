collecting
omniscientCollect: anObject in: aCollector withReifications: anArrayOfReifications
	| item  |
	item := self omniscientItemClass new.
	item rawData: anArrayOfReifications.
	item reificationSpec: aCollector reifications.
	aCollector applyTransformationsTo: item from: anArrayOfReifications.
	aCollector omniscientCollectItem: item