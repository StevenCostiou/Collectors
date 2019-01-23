behavior - api
setDiffBlockFrom: aString
	self
		diffBlock:
			((Smalltalk compiler evaluate: aString)
				ifNil: [ [ :a :b | (a = b) not ] ])