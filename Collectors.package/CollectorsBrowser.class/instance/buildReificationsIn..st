building - configuration
buildReificationsIn: tab
	tab transmit
		to: #reificationsList;
		andShow: [ :a | 
			a fastList
				title: 'Collected Metadata';
				display: [ selectedCollector configuration reifications ];
				act: [ :presentation | 
					| availableReifs |
					availableReifs := allReifications asOrderedCollection.
					availableReifs removeAllFoundIn: selectedCollector installer baseReifications.
					((TickDialogWindow itemsList: availableReifs itemsHeaderName: 'Metadata' title: 'Add Metadata') choose
						ifNil: [ #() ]) do: [ :reif | selectedCollector configuration addReification: reif ].
					selectedCollector reinstall.
					presentation update.
					collectorAnnouncer announce: SelectedReificationsHaveChanged ]
					icon: GLMUIThemeExtraIcons glamorousAdd
					entitled: 'Add metadata';
				act: [ :presentation | 
					selectedCollector configuration reifications remove: presentation selection ifAbsent: [  ].
					selectedCollector reinstall.
					presentation update.
					collectorAnnouncer announce: SelectedReificationsHaveChanged ]
					icon: GLMUIThemeExtraIcons glamorousTrash
					entitled: 'Remove' ]