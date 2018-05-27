building
buildReificationsCheckBoxesIn: presentation for: aCollector
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
							| checkbox |
							checkbox := CheckboxMorph new.	" on: self selected: #test changeSelected: #test:."	"new.
							checkbox model: reifications.
							checkbox setStateSelector: #add:."
							checkbox label: reif.
							(aCollector installer availableReifications includes: reif)
								ifFalse: [ checkbox disable ].
							checkbox ] ] ]