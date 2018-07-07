building - configuration
buildConditionsIn: tab
	tab transmit
		to: #conditions;
		andShow: [ :a | 
			a fastList
				title: 'Conditions';
				display: selectedCollector configuration conditions;
				act: [ :presentation | 
					| newCond name |
					newCond := CollectEvaluation new.
					name := self requestUniqueConditionName.
					name ifNotEmpty: [ selectedCollector configuration conditions add: (newCond name: name) ].
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousAdd
					entitled: 'Add';
				act: [ :presentation | 
					presentation selection
						ifNotNil: [ | name |
							name := self requestConditionRename: presentation selection name.
							name ifNotEmpty: [ presentation selection name: name ].
							presentation update ] ]
					icon: GLMUIThemeExtraIcons glamorousEdit
					entitled: 'Rename';
				act: [ :presentation | 
					selectedCollector configuration conditions remove: presentation selection ifAbsent: [  ].
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousTrash
					entitled: 'Remove';
				selectionAct: [ :presentation | 
					| name |
					name := self requestConditionRename: presentation selection name.
					name ifNotEmpty: [ presentation selection name: name ].
					presentation update ]
					entitled: 'Rename';
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
					selectedCollector configuration compileConditionsWith: selectedCollector installer reifications.
					a update ]
					on: $s
					entitled: 'Accept'.
			collectorAnnouncer
				when: SelectedReificationsHaveChanged
				do: [ script
						resetBindings;
						variableBindings: [ :bindings | bindings addAll: [ selectedCollector installer reifications collect: [ :reif | reif -> reif ] ] ].
					script update ] ]