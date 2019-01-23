behavior - api
setDiffBlockFrom: aString
	self
		diffBlock:
			((Smalltalk compiler evaluate: (aString ifNil:['']))
				ifNil: [ [ :a :b | (a = b) not ] ])