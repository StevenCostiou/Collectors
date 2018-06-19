building - collectPoints visualization
buildEmptyStackin: tab
	tab transmit
		to: #itemStack;
		andShow: [ :a | 
			a title: 'Collected sub-expressions'.
			a fastTable
				tagsStyle: #greenRoundedButton;
				display: [  ];
				column: ' ' evaluated: [  ] width: 10;
				column: 'Expression Stack' evaluated: [  ];
				column: 'Old Value' evaluated: [  ] width: 130;
				column: 'New Value' evaluated: [  ] width: 130;
				column: 'Value' evaluated: [  ] width: 130 ]