initialization
initialize
	super initialize.
	behavior := CollectBehavior new.
	self resetReifications.
	self initializeLink