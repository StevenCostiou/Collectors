menu-collectors
collectReceiverIn: context on: aBuilder
	aBuilder
		item: 'Collect receiver';
		target: self;
		selector: #collectReceiverInContext:;
		arguments: (Array with: context)