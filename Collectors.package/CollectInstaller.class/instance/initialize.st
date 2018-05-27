initialization
initialize
	super initialize.
	behavior := CollectBehavior new.
	reifications := OrderedCollection new.
	reifications
		add: self collectorNode;
		addAll: self baseReifications.
	self initializeLink