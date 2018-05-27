menu
collectTempVarIn: context on: aBuilder
	aBuilder
		item: 'Temporary';
		target: self;
		selector: #collectTemporaryInContext:;
		arguments: (Array with: context)