menu-collectors
collectInstVarIn: context on: aBuilder.
	aBuilder
		item: 'Collect Instance Variable';
		target: self;
		selector: #collectInstVarInContext:;
		arguments: (Array with: context)