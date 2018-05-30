initialization
initialize
	super initialize.
	reifications := OrderedCollection new.
	reifications add: #name; add: #value.
	allReifications := #(#arguments #receiver #entity #link #name #oldValue #newValue #selector #sender #value #object #class)