building
buildConditionsIn: tab
	"withGhostText: 'Write condition';
		act: [ :thePane | 
			| src |
			src := (thePane pane port: #text) value.
			cond source: src.
			a update ]
		on: $s;"

	tab transmit
		to: #conditions;
		andShow: [ :a | 
			a fastList
				title: 'Conditions';
				display: collector configuration conditions;
				act: [ :presentation | 
					| newCond |
					newCond := CollectEvaluation new.
					collector configuration conditions add: (newCond name: (UIManager default request: 'Evaluation Name')).
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousAdd
					entitled: 'Add';
				act: [ :presentation | 
					collector configuration conditions remove: presentation selection.
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousTrash
					entitled: 'Remove';
				selectionAct: [ :presentation | 
					collector configuration conditions remove: presentation selection.
					presentation update ]
					entitled: 'Remove' ].
	tab transmit
		to: #selectedCondition;
		from: #conditions;
		andShow: [ :a :cond | 
			a pharoScript
				title: 'Edit condition';
				smalltalkClass: [ Object ];
				variableBindings: [ reificationsHandler reifications collect: [ :reif | reif -> reif ] ];
				updateOn: SelectedReificationsHaveChanged from: [ announcer ];
				display: cond source;
				selectionAct: [ :thePane | 
					| src |
					src := (thePane pane port: #text) value.
					cond source: src.
					a update ]
					on: $s
					entitled: 'Accept' ]