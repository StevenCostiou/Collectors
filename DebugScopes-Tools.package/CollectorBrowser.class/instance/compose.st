building
compose
	self updateCollectorList.
	self tabulator
		with: [ :browser | 
			browser
				column: [ :c | 
					c row: #list.
					c row: #def ].
			browser column: #script.
			browser transmit
				to: #list;
				andShow: [ :a | 
					a title: 'Collectors'.
					a act: [ :presentation | presentation selection inspect ] icon: GLMUIThemeExtraIcons glamorousBrowse entitled: 'Inspect'.
					a
						act: [ :presentation | 
							[ presentation selection release ]
								on: Error
								do: [ :err | err crLog ] ]
						icon: GLMUIThemeExtraIcons glamorousRemove
						entitled: 'Release'.
					a
						act: [ :presentation | presentation selection collectedObjects inspect ]
						icon: GLMUIThemeExtraIcons glamorousGrayCircleEmpty
						entitled: 'Objects'.
					a fastTable
						updateOn: self updateAnnoucement from: [ self updateAnnouncer ];
						display: collectors;
						selectionAct: [ :presentation | self renameCollector: presentation selection ] entitled: 'Rename...';
						column: 'Collector' evaluated: [ :each | each asString ] width: 250;
						column: 'Collector Type' evaluated: [ :each | each type ] width: 150;
						column: 'Collected Objects (total)' evaluated: [ :each | each totalCollectedObjects ] width: 30 ].
			browser transmit
				from: #list;
				to: #def;
				andShow: [ :a :collector | self buildCollectorDefinitionFor: collector in: a ].
			browser transmit
				from: #list;
				to: #script;
				andShow: [ :a :collector | self buildCollectorScriptFor: collector in: a ] ]