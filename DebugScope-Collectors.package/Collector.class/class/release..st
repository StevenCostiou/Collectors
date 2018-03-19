as yet unclassified
release: collector
	self collectors remove: collector ifAbsent: [  ].
	DebugScopeGlobalAnnouncer default announce: ObjectCollectorHasChanged