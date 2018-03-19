private
renameCollector: collector
	| name |
	name := UIManager default
		request: 'Rename...'
		initialAnswer: (collector scopeName ifNil: [ collector printString ])
		title: 'Rename...'.
	collector scopeName: name.
	DebugScopeGlobalAnnouncer default announce: self updateAnnoucement 