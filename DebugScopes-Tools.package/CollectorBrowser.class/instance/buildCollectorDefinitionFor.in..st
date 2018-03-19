building
buildCollectorDefinitionFor: collector in: a
	| node |
	node := collector weakNodeReference.
	collector type = collector instVarScopeType
		ifTrue: [ a fastTable
				title: collector title;
				display: (node usingMethods collect: [ :m | m compiledMethod ]);
				column: 'Using methods' evaluated: [ :each | each printString ] width: 500;
				selectionAct: [ :tree | tree selection browse ] on: $i entitled: 'Browse'.
			^ self ].
	a pharoMethod
		title: collector title;
		smalltalkClass: [ node methodNode methodClass ];
		primarySelectionInterval: (node start to: node stop);
		variableBindings: [ {(#node -> node)} ];
		display: collector printSpecification