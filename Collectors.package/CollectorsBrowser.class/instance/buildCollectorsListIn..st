building
buildCollectorsListIn: aPresentation
	| list |
	list := aPresentation fastList.
	list updateOn: ObjectCollectorHasChanged from: [ CollectorAnnouncer default weak ].
	list selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect'.
	list selectionAct: [ :presentation | CollectorConfigurationEditor new collector: presentation selection; openOn: #() ] entitled: 'Edit Configuration'.
	list display: collectors.
	list format: [ :col | col printDefinition ].
	list tags: [ :col | col type ]