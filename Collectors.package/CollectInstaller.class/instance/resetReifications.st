behavior
resetReifications
	reifications := OrderedCollection new.
	reifications
		add: self collectorNode;
		addAll: self baseReifications