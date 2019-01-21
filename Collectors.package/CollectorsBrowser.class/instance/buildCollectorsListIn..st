building
buildCollectorsListIn: aPresentation
	| list |
	list := aPresentation fastList.
	list
		act: [ self updateCollectorList.
			self update ]
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Refresh'.
	list updateOn: ObjectCollectorHasChanged from: [ CollectorAnnouncer default weak ].
	list selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect'.
	list
		selectionAct: [ :presentation | 
			presentation selection uninstall.
			self updateCollectorList ]
		entitled: 'Uninstall'.
	list display: collectors.
	list format: [ :col | col printDefinition ].
	list tags: [ :col | col type ]