building - collectPoints visualization
buildButtonNamed: buttonName action: action label: label model: model in: composite
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
					button on: #mouseUp send: action to: model.
					model isBlock
						ifTrue: [ button color: Color yellow ].
					button label: label.
					button addMorphFront: (self iconNamed: #history) asMorph.
					button ] ]