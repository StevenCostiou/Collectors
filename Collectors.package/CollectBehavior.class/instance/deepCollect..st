collecting
deepCollect: anArrayOfReifications
	| "deepInstaller" collector  item |
	"deepInstaller := anArrayOfReifications second."
	collector := anArrayOfReifications first.
	item := OmniscientItem new.
	item rawData: anArrayOfReifications.
	"item reificationSpec: deepInstaller reifications."
	collector deepCollectItem: item for: nil"deepInstaller originalNode"
	