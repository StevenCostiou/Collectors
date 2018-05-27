initialization
initialize
	super initialize.
	reifications := OrderedCollection new.
	reifications add: #name.
	allReifications := #(#arguments #receiver #entity #link #name #oldValue #newValue #selector #sender #value #object #class)