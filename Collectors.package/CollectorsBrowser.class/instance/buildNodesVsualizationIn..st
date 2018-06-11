building - collectPoints visualization
buildNodesVsualizationIn: tab
	tab transmit
		to: #itemNodes;
		andShow: [ :a | 
			a title: 'CollectPoints'.
			a fastList display: selectedCollector collectPoints ].
	tab transmit
		from: #itemNodes;
		to: #collectionTime;
		andShow: [ :a :collectPoint | 
			| itemsByTime |
			itemsByTime := (selectedCollector omniscientCollectedItems select: [ :item | item node == collectPoint ])
				sorted: [ :item1 :item2 | item1 timestamp < item2 timestamp ].
			a title: 'Collection time'.
			a fastList
				display: itemsByTime;
				format: [ :item | item timestamp ] ].
	tab transmit
		from: #itemNodes;
		to: #itemSource;
		andShow: [ :a :collectionPoint | 
			self buildItemSegmentFor: collectionPoint.
			self nodeVisu: collectionPoint in: a ]