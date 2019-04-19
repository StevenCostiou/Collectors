compiling
compileWith: bindings
	| stream |
	stream := WriteStream on: String new.
	stream nextPut: $[.
	stream nextPutAll: ':collector'.
	stream space.
	bindings
		from: 2
		to: bindings size
		do: [ :binding | 
			stream nextPut: $:.
			stream nextPutAll: binding asString.
			stream space ].
	stream nextPut: $|.
	stream nextPutAll: self source.
	stream nextPut: $].
stream contents inspect.
	self block: (Smalltalk compiler evaluate: stream contents)