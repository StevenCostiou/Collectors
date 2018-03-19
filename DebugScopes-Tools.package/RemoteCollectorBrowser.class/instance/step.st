private
step
	currentSize = RemoteDebugger current collectors size
		ifFalse: [ currentSize := RemoteDebugger current collectors size.
			collectors removeAll.
			collectors addAll: RemoteDebugger current collectors ].
	DebugScopeGlobalAnnouncer default announce: ObjectCollectorHasChanged