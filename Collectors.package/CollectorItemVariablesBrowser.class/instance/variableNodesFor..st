private building
variableNodesFor: anObject
	| variableNodes |
	showSelf ifTrue:[^super variableNodesFor: anObject].
	variableNodes := OrderedCollection new: anObject class allSlots size.
	self basicVariableNodesFor: anObject in: variableNodes.
	^ variableNodes