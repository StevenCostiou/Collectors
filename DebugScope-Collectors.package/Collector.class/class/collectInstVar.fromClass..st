as yet unclassified
collectInstVar: ivarName fromClass: className
	| collector |
	collector := InstanceVariableScope new.
	collector collectInstanceVariableNamed: ivarName fromClass: (Smalltalk at: className).
 	self collectors add: collector.
	DebugScopeGlobalAnnouncer default announce: ObjectCollectorHasChanged.
	^ collector