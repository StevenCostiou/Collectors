installing
uninstall
	nodes
		do: [ :node | 
			node collector == collector
				ifTrue: [ node removeCollector ] ].
	collector := nil.
	super uninstall