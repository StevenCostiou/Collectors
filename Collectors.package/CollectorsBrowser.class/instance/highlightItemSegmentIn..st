building - collectPoints visualization
highlightItemSegmentIn: tab
	tab transmit
		from: #itemStack;
		to: #itemSource;
		andShow: [ :a :bitItem | 
			bitItem
				ifNotNil: [ self buildStackedItemSegmentFor: bitItem node.
					self nodeVisu: bitItem node in: a ];
				ifNil: [ self buildSourceIn: tab ] ]