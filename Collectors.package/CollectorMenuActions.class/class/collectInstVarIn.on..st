menu
collectInstVarIn: context on: aBuilder
	aBuilder
		item: 'Instance Variable';
		target: self;
		selector: #collectInstVarInContext:;
		arguments: (Array with: context)