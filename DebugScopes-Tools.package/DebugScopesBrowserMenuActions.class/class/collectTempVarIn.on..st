menu-collectors
collectTempVarIn: context on: aBuilder
	aBuilder
		item: 'Collect temporary';
		target: self;
		selector: #collectTemporaryInContext:;
		arguments: (Array with: context)