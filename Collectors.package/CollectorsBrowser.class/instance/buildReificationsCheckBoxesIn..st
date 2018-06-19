building - configuration - deprecated
buildReificationsCheckBoxesIn: presentation
	| reifPresentation |
	reifPresentation := presentation tabulator.
	reifPresentation
		addColumn: [ :c | 
			c
				row: #name;
				row: #oldValue;
				row: #newValue;
				row: #value ].
	reifPresentation
		addColumn: [ :c | 
			c
				row: #link;
				row: #entity;
				row: #object;
				row: #class ].
	reifPresentation
		addColumn: [ :col | 
			col
				row: #sender;
				row: #receiver;
				row: #selector;
				row: #arguments ].
	allReifications
		do: [ :reif | 
			reifPresentation transmit
				to: reif;
				andShow: [ :composite | 
					composite morph
						morph: [ :morphPresentation | 
							| checkbox model |
							checkbox := CheckboxMorph new.
							model := ReificationCheckBoxModel on: reificationsHandler forReification: reif.
							checkbox on: model selected: #state changeSelected: #state:.
							checkbox label: reif.
							(selectedCollector installer availableReifications includes: reif)
								ifFalse: [ checkbox disable ].
							checkbox ] ] ]