building
composeOld
	| tab itemsByTime stack |
	tab := self tabulator.
	itemsByTime := Dictionary new.
	stack := Dictionary new.
	(collector omniscientCollectedItems select: [ :item | item node == node ])
		do: [ :item | itemsByTime at: item timestamp put: item ].
	tab title: node printString , ' history'.
	tab
		with: [ :browser | 
			browser
				row: [ :r | 
					r
						column: #time span: 1;
						column: #itemStack span: 3;
						column: #itemSource span: 3 ].
			browser
				row: [ :r | 
					r
						column: #contextStack;
						column: #contextSource ].
			browser row: #contextInspector.

			"Display the collection times"
			browser transmit
				to: #time;
				andShow: [ :a | 
					a title: 'Collection time'.
					a fastList display: itemsByTime keys asSortedCollection ].

			"Inspect the selected item"
			browser transmit
				from: #time;
				to: #itemStack;
				andShow: [ :a :timestamp | 
					| item i |
					item := itemsByTime at: timestamp.
					stack := Dictionary new.
					i := 1.
					item backInTimeItems
						do: [ :bitItem | 
							stack at: i put: bitItem.
							i := i + 1 ].
					stack at: i put: item.
					a title: 'Collected sub-expressions'.
					a
						act: [ :s | 
							[ collector replayCollectedItem: (stack at: s selection) ]
								on: Error
								do: [ :err | err inspect ] ]
						icon: (self iconNamed: #smallUpdate)
						entitled: 'Use as replay'.
					a fastTable
						tagsStyle: #greenRoundedButton;
						display: stack keys;
						column: ' ' evaluated: [ :each | each ] width: 10;
						column: 'Expression Stack'
							evaluated: [ :each | 
							| subNode stackItem |
							stackItem := stack at: each.
							subNode := stackItem node.
							subNode source copyFrom: subNode start to: subNode stop ]
							tags: [ :each | 
								(stack at: each) oldValue = (stack at: each) newValue
									ifFalse: [ 'value change' ]
									ifTrue: [ #() ] ];
						column: 'Old Value' evaluated: [ :each | (stack at: each) oldValue ] width: 70;
						column: 'New Value' evaluated: [ :each | (stack at: each) newValue ] width: 70;
						column: 'Value' evaluated: [ :each | (stack at: each) collectedObject ] width: 70 ].

			"Transmit the selected item node the visualization"
			browser transmit
				from: #time;
				to: #itemSource;
				andShow: [ :a :timestamp | 
					| item |
					item := itemsByTime at: timestamp.
					self buildItemSegmentFor: item node.
					self nodeVisu: item node in: a ].

			"Transmit the selected item node the visualization"
			browser transmit
				from: #itemStack;
				to: #itemSource;
				andShow: [ :a :i | 
					stack
						at: i
						ifPresent: [ :item | 
							self buildStackedItemSegmentFor: item node.
							self nodeVisu: item node in: a ] ].

			"Context stack"
			browser transmit
				from: #time;
				to: #contextStack;
				andShow: [ :a :timestamp | 
					| item |
					item := itemsByTime at: timestamp.
					a title: 'Context Stack'.
					a fastList display: item context ].

			"Context stack method"
			browser transmit
				from: #contextStack;
				to: #contextSource;
				andShow: [ :a :context | 
					a title: 'Context Source'.
					context
						ifNotNil: [ a pharoMethod
								smalltalkClass: [ context contextClass ];
								display: context sourceCode ] ].

			"Context inspector"
			browser transmit
				from: #contextStack;
				to: #contextInspector;
				andShow: [ :a :context | 
					context
						ifNotNil: [ a dynamic
								display: [ :x | 
									(GLMCompositePresentation new
										with: [ :aComposite | 
											context gtCollectorRawIn: aComposite showSelf: true.
											aComposite ]) startOn: x ] ] ] ]