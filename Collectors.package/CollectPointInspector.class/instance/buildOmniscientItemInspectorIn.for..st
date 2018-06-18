building
buildOmniscientItemInspectorIn: presentation for: item
	| object |
	object := item node isVariable
		ifTrue: [ item oldValue ]
		ifFalse: [ item collectedObject ifNil: [ item sourceObject ifNil: [ item newValue ] ] ].
	presentation tabulator
		title: object printString;
		with: [ :browser | 
			browser row: #inspectedItem span: 7.
			browser row: #buttons span: 1.
			browser transmit
				to: #inspectedItem;
				andShow: [ :a | 
					a pager
						fixedSizePanes: 1;
						showFirst: [ :x | x fastList display: (Array with: object) ];
						show: [ :composite :e | e gtCollectorRawIn: composite ] ].
			browser transmit
				to: #buttons;
				andShow: [ :composite | self composeActionButtonsFor: item in: composite ] ].
	presentation tabulator
		title: 'Meta data';
		with: [ :browser | 
			browser column: #inspectedMetaData.
			browser transmit
				to: #inspectedMetaData;
				andShow: [ :a | item gtCollectorRawIn: a ] ]