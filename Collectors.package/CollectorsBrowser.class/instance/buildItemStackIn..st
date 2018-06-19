building - collectPoints visualization
buildItemStackIn: tab
	tab transmit
		from: #collectionTime;
		to: #itemStack;
		andShow: [ :a :item | 
			| itemList |
			itemList := item backInTimeItems copy.
			itemList add: item.
			item
				ifNotNil: [ a title: 'Collected sub-expressions'.
					a fastTable
						tagsStyle: #greenRoundedButton;
						display: itemList;
						column: ' ' evaluated: [ :bitItem | itemList indexOf: bitItem ] width: 10;
						column: 'Expression Stack'
							evaluated: [ :bitItem | 
							| subNode |
							subNode := bitItem node.
							subNode source copyFrom: subNode start to: subNode stop ]
							tags: [ :bitItem | 
								bitItem oldValue = bitItem newValue
									ifFalse: [ 'value change' ]
									ifTrue: [ #() ] ];
						column: 'Old Value' evaluated: [ :bitItem | bitItem oldValue ] width: 130;
						column: 'New Value' evaluated: [ :bitItem | bitItem newValue ] width: 130;
						column: 'Value' evaluated: [ :bitItem | bitItem collectedObject ] width: 130 ] ].
	self highlightItemSegmentIn: tab.
	self buildActionButtonsIn: tab