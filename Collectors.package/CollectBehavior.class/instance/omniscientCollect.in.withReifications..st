collecting
omniscientCollect: anObject in: aCollector withReifications: anArrayOfReifications
	| item |
	item := self omniscientItemClass new.
	item rawData: anArrayOfReifications.
	item reificationSpec: aCollector reifications.
	"((aCollector reifications includes: #context)
		and: [ aCollector metaController stackSize > 0 ])
		ifTrue: [ item copyContext: item context ]."
	aCollector applyTransformationsTo: item from: anArrayOfReifications.
	aCollector omniscientCollectItem: item