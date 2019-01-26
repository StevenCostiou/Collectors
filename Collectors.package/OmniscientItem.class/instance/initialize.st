initialization
initialize
	super initialize.
	transformations := Dictionary new.
	"timestamp := Time now."
	"default reifications"
	reificationSpec := #(#collector #value #node #context #newValue)