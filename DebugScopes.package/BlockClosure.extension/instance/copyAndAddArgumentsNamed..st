*DebugScopes
copyAndAddArgumentsNamed: argsArray
	"Build a copy of self, adds the arguments passed and returns it."

	| block |
	block := self copy.
	argsArray
		do: [ :argName | 
			| arg |
			arg := RBArgumentNode named: argName.
			block sourceNode arguments add: arg ].
	^ Smalltalk compiler evaluate: block printString