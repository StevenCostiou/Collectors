building - configuration
buildInstallButtonIn: tab
	tab transmit
		to: #installButton;
		andShow: [ :composite | 
			composite morph
				morph: [ :morphPresentation | 
					| button |
					(button := SimpleButtonMorph new)
						on: #mouseUp send: #reinstallCollector to: self;
						label: 'Install';
						yourself ] ]