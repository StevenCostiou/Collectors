menu
collectResultIn: context on: aBuilder
	aBuilder
		item: 'Resulting value';
		target: self;
		selector: #collectResultInContext:;
		arguments: (Array with: context)