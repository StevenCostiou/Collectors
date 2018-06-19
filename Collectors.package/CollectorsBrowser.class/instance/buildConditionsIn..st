building - configuration
buildConditionsIn: tab
	tab transmit
		to: #conditions;
		andShow: [ :a | 
			a fastList
				title: 'Conditions';
				display: selectedCollector configuration conditions;
				act: [ :presentation | 
					| newCond |
					newCond := CollectEvaluation new.
					selectedCollector configuration conditions
						add: (newCond name: ((UIManager default request: 'Condition Name' initialAnswer: 'a Condition') ifNil: [ 'a Condition' ])).
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousAdd
					entitled: 'Add';
				act: [ :presentation | 
					selectedCollector configuration conditions remove: presentation selection ifAbsent: [  ].
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousTrash
					entitled: 'Remove';
				selectionAct: [ :presentation | 
					selectedCollector configuration conditions remove: presentation selection.
					presentation update ]
					entitled: 'Remove' ].
	tab transmit
		from: #conditions;
		to: #selectedCondition;
		andShow: [ :a :cond | 
			| script |
			script := a pharoScript.
			script
				title: 'Edit condition';
				smalltalkClass: [ Object ];
				variableBindings: [ selectedCollector installer reifications collect: [ :reif | reif -> reif ] ];
				display: (cond source ifNil: [ '' ]);
				selectionAct: [ :thePane | 
					| src |
					src := (thePane pane port: #text) value.
					cond source: src.
					thePane clearUserEdits.
					a update ]
					on: $s
					entitled: 'Accept'.
			collectorAnnouncer
				when: SelectedReificationsHaveChanged
				do: [ script
						resetBindings;
						variableBindings: [ :bindings | bindings addAll: [ selectedCollector installer reifications collect: [ :reif | reif -> reif ] ] ].
					script update ] ]