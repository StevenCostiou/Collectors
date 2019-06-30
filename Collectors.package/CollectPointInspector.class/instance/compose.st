building
compose
	self tabulator
		with: [ :browser | 
			browser
				row: [ :r | 
					r
						column: #time span: 2;
						column: #itemStack span: 3;
						column: #itemSource span: 7 ]
				span: 4.
			browser
				row: [ :r | 
					r column: #objectInspector.
					r column: #contextStack.
					r column: #context ]
				span: 4.

			"Display the collection times"
			browser transmit
				to: #time;
				andShow: [ :a | 
					a title: 'Mining result'.
					a act: [ self setDiffBlock ] icon: (Smalltalk iconNamed: #diff) entitled: 'Set diff block'.
					a fastList
						icon: [:each | ObjectMinersIcons minersMenuIcon];					 
						display: collector omniscientCollectedItems "asSortedCollection";
						format: [ :each | each collectedObject printString ];
						tagsStyle: #greenRoundedButton;
						tags: [ :each | 
							(collector valueChangedFor: each in: collector omniscientCollectedItems)
								ifTrue: [ 'value change' ]
								ifFalse: [ #() ] ] ].

			"Inspect the selected item"
			browser transmit
				from: #time;
				to: #itemStack;
				andShow: [ :a :item | 
					| stack |
					stack := item backInTimeItems copy. self flag: 'That copy is suspicious...'.
					stack add: item.
					a title: 'Mining results from sub-expressions'.
					a fastTable
						tagsStyle: #greenRoundedButton;
						display: stack;
						column: ' ' evaluated: [ :each | stack identityIndexOf: each ] width: 15;
						column: 'Expression Stack'
							evaluated: [ :each | 
							| subNode |
							subNode := each node.
							self
								buildSubExpressionMorphFor: (subNode source copyFrom: subNode start to: subNode stop)
								changeDetected: (collector valueChangedFor: each in: item backInTimeItems) ]
							tags: [ :each | 
								(collector valueChangedFor: each in: item backInTimeItems)
									ifFalse: [ #() ]
									ifTrue: [ #()"'value change'" ] ] ].

			"Transmit the selected item node the visualization"
			browser transmit
				from: #time;
				to: #itemSource;
				when: [ :item | item notNil ];
				andShow: [ :a :item | 
					self buildItemSegmentFor: item node.
					self nodeVisu: item node in: a ].

			"Transmit the selected item node the visualization"
			browser transmit
				from: #itemStack;
				to: #itemSource;
				when: [ :subitem | subitem notNil ];
				andShow: [ :a :subitem | 
					self buildStackedItemSegmentFor: subitem node.
					self nodeVisu: subitem node in: a ].
			browser transmit
				from: #itemStack;
				to: #objectInspector;
				when: [ :item | item notNil ];
				andShow: [ :a :item | self buildOmniscientItemInspectorIn: a for: item ].
			browser transmit
				from: #time;
				to: #contextStack;
				when: [ :item | item notNil ];
				andShow: [ :a :item | 
					a fastList
						title: 'Stack';
						display: (item context isContext ifTrue:[item context] ifFalse:[OrderedCollection new]) ].
			browser transmit
				from: #contextStack;
				to: #context;
				when: [ :ctx | ctx notNil ];
				andShow: [ :a :ctx | 
					"Actions on selected stack item"
					"browser transmit
				from: #itemStack;
				to: #actions;
				when: [ :subitem | subitem notNil ];
				andShow: [ :composite :subitem | self composeActionButtonsFor: subitem in: composite ]"
					a pharoMethod
						title: 'Source';
						smalltalkClass: [ ctx method methodClass ];
						display: ctx method ] ]