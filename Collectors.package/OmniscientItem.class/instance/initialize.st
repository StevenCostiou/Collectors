initialization
initialize
	super initialize.
	transformations := Dictionary new.
	reificationSpec := #(#collector #value #node #context #newValue)