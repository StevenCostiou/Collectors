menu
collectReceiverIn: context on: aBuilder
	aBuilder
		item: 'Receiver';
		target: self;
		selector: #collectReceiverInContext:;
		arguments: (Array with: context)