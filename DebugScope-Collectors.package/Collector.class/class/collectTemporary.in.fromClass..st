as yet unclassified
collectTemporary: tempName in: methodName fromClass: className
	| collector |
	collector := VariableScope new.
	collector
		collectTemporaryObjectNamed: tempName
		in: methodName
		from: (Smalltalk at: className).
	self collectors add: collector.
	DebugScopeGlobalAnnouncer default announce: ObjectCollectorHasChanged.
	^ collector