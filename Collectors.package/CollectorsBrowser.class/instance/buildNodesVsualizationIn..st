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
			a title: 'Time'.
			a fastList
				display: itemsByTime;
				format: [ :item | item timestamp print24 ].
			a shouldValidate: true ].
	self buildSourceIn: tab