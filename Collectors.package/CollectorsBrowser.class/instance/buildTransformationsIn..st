building - configuration
buildTransformationsIn: tab
	tab transmit
		to: #transformations;
		andShow: [ :a | 
			a fastList
				title: 'Transformations';
				display: selectedCollector configuration transformations;
				updateOn: SelectedReificationsHaveChanged from: [ collectorAnnouncer weak ];
				act: [ :presentation | 
					| newTransfo |
					newTransfo := CollectEvaluation new.
					selectedCollector configuration transformations
						add:
							(newTransfo
								name: ((UIManager default request: 'Transformation Name' initialAnswer: 'a Transformation') ifNil: [ 'a Condition' ])).
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousAdd
					entitled: 'Add';
				act: [ :presentation | 
					selectedCollector configuration transformations remove: presentation selection.
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousTrash
					entitled: 'Remove';
				selectionAct: [ :presentation | 
					selectedCollector configuration transformations remove: presentation selection.
					presentation update ]
					entitled: 'Remove' ].
	tab transmit
		to: #selectedTransformation;
		from: #transformations;
		andShow: [ :a :transfo | 
			| script |
			script := a pharoScript.
			script
				title: 'Edit transformation';
				smalltalkClass: [ Object ];
				variableBindings: [ selectedCollector installer reifications collect: [ :reif | reif -> reif ] ];
				display: (transfo source ifNil: [ '' ]);
				selectionAct: [ :thePane | 
					| src |
					src := (thePane pane port: #text) value.
					transfo source: src.
					thePane clearUserEdits.
					selectedCollector configuration compileTransformationsWith: selectedCollector installer reifications.
					a update ]
					on: $s
					entitled: 'Accept'.
			collectorAnnouncer
				when: SelectedReificationsHaveChanged
				do: [ script
						resetBindings;
						variableBindings: [ :bindings | bindings addAll: [ selectedCollector installer reifications collect: [ :reif | reif -> reif ] ] ].
					script update ] ]