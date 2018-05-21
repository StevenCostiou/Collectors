building
buildCollectorsListIn: aPresentation
	| list |
	list := aPresentation fastList.
	list updateOn: ObjectCollectorHasChanged from: [ CollectorAnnouncer default weak ].
	list selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect'.
	list display: collectors.
	list format: [ :col | col printDefinition ].
	list tags: [ :col | col type ]