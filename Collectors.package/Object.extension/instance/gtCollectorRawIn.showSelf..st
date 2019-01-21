*Collectors
gtCollectorRawIn: composite showSelf: showSelf
	(CollectorItemVariablesBrowser new
		showSelf: showSelf;
		variablesIn: composite;
		yourself) send: #value