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
	stream nextPutAll: source.
	stream nextPut: $].
	self block: (Smalltalk compiler evaluate: stream contents)