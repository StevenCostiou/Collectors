collecting
deepCollect: anArrayOfReifications
	| collector item |
	collector := anArrayOfReifications first.
	item := OmniscientItem new.
	item rawData: anArrayOfReifications.
	collector deepCollectItem: item