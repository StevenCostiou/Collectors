building
compose
	self tabulator
		with: [ :browser | 
			browser
				column: #itemColumn;
				column: #selectionInspector.
			browser transmit
				to: #itemColumn;
				andShow: [ :a :each | 
					a title: each printString.
					a dynamic
						display: [ :x | 
							(GLMCompositePresentation new
								with: [ :aComposite | 
									each gtCollectorRawIn: aComposite.
									aComposite ]) startOn: x ] ].
			browser transmit
				from: #itemColumn;
				to: #selectionInspector;
				andShow: [ :a :each | 
					a title: each printString.
					a dynamic
						display: [ :x | 
							(GLMCompositePresentation new
								with: [ :aComposite | 
									each gtCollectorRawIn: aComposite showSelf: true.
									aComposite ]) startOn: x ] ] ]