collectors and activators - building
objectScopesBrowserOn: browser
	self updateCollectorList.
	browser transmit
		to: #collectors;
		andShow: [ :a | 
			a title: 'Collectors'.
			a act: [ :presentation | presentation selection inspect ] entitled: 'Inspect selection'.
			a act: [ :presentation | self removeObjectScope: presentation selection ] entitled: 'Remove selection'.
			a fastTable
				updateOn: ObjectCollectorHasChanged from: [ DebugScopeGlobalAnnouncer default weak ];
				selectionAct: [ :presentation | presentation selection beWeak ] entitled: 'Be Weak';
				selectionAct: [ :presentation | presentation selection beOmniscient ] entitled: 'Be Omniscient';
				selectionAct: [ :presentation | self renameScopingProperty: presentation selection ] entitled: 'Rename...';
				selectionAct: [ :presentation | 
					| collector |
					collector := presentation selection.
					collector enabled
						ifFalse: [ collector enable ] ]
					entitled: 'Enable';
				selectionAct: [ :presentation | 
					| collector |
					collector := presentation selection.
					collector enabled
						ifTrue: [ collector disable ] ]
					entitled: 'Disable';
					selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect';
				display: collectors;
				column: 'Collector' evaluated: [ :each | each printDefinition ] width: 400;
				column: 'Collector Type' evaluated: [ :each | each type ] width: 150;
				"column: 'Collected Objects' evaluated: [ :each | each numberOfCollectedObjects ] width: 15;"
					icon: [ :each | 
					each enabled
						ifTrue: [ GLMUIThemeExtraIcons glamorousGreenCircle ]
						ifFalse: [ GLMUIThemeExtraIcons glamorousRedCircle ] ] ].
	browser transmit
		from: #collectors;
		to: #objectDefinition;
		andShow: [ :a :scope | self buildObjectScopeDefinitionFor: scope in: a ]