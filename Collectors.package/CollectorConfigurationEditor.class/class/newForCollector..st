instance creation
newForCollector: aCollector
	self basicNew
	selectedCollector: aCollector;
	initialize;
	title: 'Configuration';
	openOn: #()