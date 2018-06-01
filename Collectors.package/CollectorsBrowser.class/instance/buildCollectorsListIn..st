building
buildCollectorsListIn: aPresentation
	| list |
	self flag: 'Edit Configuration has to be definied'.
	list := aPresentation fastList.
	list updateOn: ObjectCollectorHasChanged from: [ CollectorAnnouncer default weak ].
	list selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect'.
	list selectionAct: [ :presentation |  ] entitled: 'Edit Configuration'.
	list selectionAct: [ :presentation | presentation selection uninstall ] entitled: 'Uninstall'.
	list display: collectors.
	list format: [ :col | col printDefinition ].
	list tags: [ :col | col type ]