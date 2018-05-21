building
collectorsBrowserOn: browser
	self updateCollectorList.
	browser transmit
		to: #collectors;
		andShow: [ :a | 
			| table |
			a title: 'Collectors'.
			table := a fastTable.
			table updateOn: ObjectCollectorHasChanged from: [ CollectorAnnouncer default weak ].
			table selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect'.
			table display: collectors.
			table
				act: [ :presentation | self removeObjectScope: presentation selection ]
				entitled: 'Remove (Doesn''t work)'.
			table column: 'Collector' evaluated: [ :each | each printDefinition ] width: 400.
			table column: 'Collector Type' evaluated: [ :each | each type ] width: 150 ]
	"browser transmit
		from: #collectors;
		to: #definition;
		andShow: [ :a :collector | collector buildInComposite: a ]"