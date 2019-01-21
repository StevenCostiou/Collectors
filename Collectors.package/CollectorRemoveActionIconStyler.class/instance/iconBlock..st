testing
iconBlock: aNode
	^ [ (self confirm: 'Uninstall Collector?')
		ifTrue: [ aNode collector uninstall ] ]