building
buildButtonNamed: buttonName label: label model: model color: aColor icon: anIcon in: composite
	composite column: buttonName.
	composite transmit
		to: buttonName;
		andShow: [ :a | 
			a morph
				morph: [ :morphPresentation | 
					| button |
					button := SimpleButtonMorph new.
					button
						layoutPolicy: RowLayout new;
						listDirection: #leftToRight;
						wrapCentering: #center;
						listCentering: #center;
						cellInset: 5 @ 0;
						layoutInset: 5 @ 0.
					button on: #mouseUp send: #value to: model.
					button color: aColor.
					button label: label.
					anIcon ifNotNil: [ button addMorphFront: anIcon asMorph ].
					button ] ]