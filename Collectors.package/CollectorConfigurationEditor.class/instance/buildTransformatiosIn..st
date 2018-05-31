building
buildTransformatiosIn: tab
	tab transmit
		to: #transformations;
		andShow: [ :a | 
			a fastList
				title: 'Transformations';
				display: collector configuration transformations;
				act: [ :presentation | 
					| newTransfo |
					newTransfo := CollectEvaluation new.
					collector configuration transformations add: newTransfo.
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousAdd
					entitled: 'Add';
				act: [ :presentation | 
					collector configuration transformations remove: presentation selection.
					presentation update ]
					icon: GLMUIThemeExtraIcons glamorousTrash
					entitled: 'Remove';
				selectionAct: [ :presentation | 
					collector configuration transformations remove: presentation selection.
					presentation update ]
					entitled: 'Remove' ].
	tab transmit
		to: #selectedTransformation;
		from: #transformations;
		andShow: [ :a :transfo | 
			a pharoScript
				title: 'Edit transformation';
				smalltalkClass: [ Object ];
				variableBindings: [ reificationsHandler reifications collect: [ :reif | reif -> reif ] ];
				display: transfo source;
				selectionAct: [ :thePane | 
					| src |
					src := (thePane pane port: #text) value.
					transfo source: src ]
					on: $s
					entitled: 'Accept' ]