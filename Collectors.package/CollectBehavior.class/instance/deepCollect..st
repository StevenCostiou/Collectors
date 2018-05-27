collecting
deepCollect: anArrayOfReifications
	| deepInstaller collector sortedReifications item |
	deepInstaller := anArrayOfReifications first.
	collector := anArrayOfReifications second.
	collector isInReplayMode ifTrue:[^self].
	sortedReifications := self sortReifications: anArrayOfReifications with: deepInstaller reifications.
	item := OmniscientItem fromReifications: sortedReifications.
	collector deepCollectItem: item for: deepInstaller originalNode