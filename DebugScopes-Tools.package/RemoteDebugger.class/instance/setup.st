as yet unclassified
setup
	remotePharo := TlpRemoteIDE connectTo: (TCPAddress ip: #[192 168 1 26] port: 40423).
	DebugScopesBrowserMenuActions
		remoteClass: (remotePharo evaluate: [ Smalltalk at: #DebugScopesBrowserMenuActions ]).
	^ self