initialization
initialize
	super initialize.
	behavior := CollectBehavior new.
	reifications := OrderedCollection new.
	reifications
		add: self collectorNode;
		add: self baseReification.
	self initializeLink