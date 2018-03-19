as yet unclassified
collectReceiversOfNode: messageNode
	| collector |
	collector := VariableScope new.
	collector collectReceiverObject: messageNode.
	self collectors add: collector.
	DebugScopeGlobalAnnouncer default announce: ObjectCollectorHasChanged.
	^ collectors