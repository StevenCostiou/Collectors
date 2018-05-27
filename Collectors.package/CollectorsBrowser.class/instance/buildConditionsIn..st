building
buildConditionsIn: tab
	tab transmit
		to: #conditions;
		andShow: [ :a :col | 
			a fastList
				title: 'Conditions';
				display: col configuration conditions;
				act: [ :presentation | 
					| newCond |
					newCond := CollectEvaluation new.
					col configuration conditions add: newCond.
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousAdd
					entitled: 'Add';
				act: [ :presentation | 
					col configuration conditions remove: presentation selection.
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousTrash
					entitled: 'Remove';
				selectionAct: [ :presentation | 
					col configuration conditions remove: presentation selection.
					presentation update ]
					entitled: 'Remove' ].
	tab transmit
		to: #selectedCondition;
		from: #conditions;
		andShow: [ :a :cond | 
			a pharoScript
				title: 'Edit condition';
				smalltalkClass: [ Object ];
				variableBindings: [ reifications collect: [ :reif | reif -> reif ] ];
				display: cond source;
				selectionAct: [ :thePane | 
					| src |
					src := (thePane pane port: #text) value.
					cond source: src ]
					on: $s
					entitled: 'Accept' ]