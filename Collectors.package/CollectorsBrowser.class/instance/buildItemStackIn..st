building - collectPoints visualization
buildItemStackIn: tab
	tab transmit
		from: #collectionTime;
		to: #itemStack;
		andShow: [ :a :item | 
			| stack i |
			stack := Dictionary new.
			i := 1.
			item backInTimeItems
				do: [ :bitItem | 
					stack at: i put: bitItem.
					i := i + 1 ].
			stack at: i put: item.
			a title: 'Collected sub-expressions'.
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
				column: 'Old Value' evaluated: [ :each | (stack at: each) oldValue ] width: 130;
				column: 'New Value' evaluated: [ :each | (stack at: each) newValue ] width: 130;
				column: 'Value' evaluated: [ :each | (stack at: each) collectedObject ] width: 130 ]