testing
iconBlock: aNode
	^ [ (self confirm: 'Uninstall Collector?')
		ifTrue: [ | collector |
			collector := aNode collector.
			collector hasMetaController
				ifTrue: [ collector metaController uninstall ]
				ifFalse: [ collector uninstall ] ] ]