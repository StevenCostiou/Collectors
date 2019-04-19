initialization
initialize
	super initialize.
	self reifications: OrderedCollection new.
	self conditions: OrderedCollection new.
	self transformations:  OrderedCollection new.
	breakAfterCount := 1