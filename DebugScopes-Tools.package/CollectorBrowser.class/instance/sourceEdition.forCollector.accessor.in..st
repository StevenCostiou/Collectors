building
sourceEdition: source forCollector: collector accessor: selector in: a
	a pharoMethod
		title: 'Method';
		smalltalkClass: [ Object ];
		display:
			(source isArray
				ifTrue: [ source first ]
				ifFalse: [ source ]) printString;
		selectionAct: [ :thepane :theselector | 
			| src block |
			src := (thepane pane port: #text) value.
			block := Smalltalk compiler evaluate: src.
			collector perform: selector with: block ]
			on: $s
			entitled: 'Accept'