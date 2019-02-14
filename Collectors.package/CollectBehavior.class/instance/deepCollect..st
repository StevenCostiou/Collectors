collecting
deepCollect: anArrayOfReifications
	| collector item |
	collector := anArrayOfReifications first.
	item := self omniscientItemClass new.
	item rawData: anArrayOfReifications.
	collector deepCollectItem: item