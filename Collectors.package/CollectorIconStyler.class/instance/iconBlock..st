testing
iconBlock: aNode
	| collector |
	collector := aNode collector.
	(self replayLinkFor: aNode)
		ifNotNil: [ :link | 
			^ [ | index |
			index := UIManager default
				chooseFrom: #('Inspect replay value' 'Turn off replay' 'Browse collector')
				title: 'Debug action'.
			index = 1
				ifTrue: [ link metaObject inspect ].
			index = 2
				ifTrue: [ collector turnOffReplay ].
			index = 3
				ifTrue: [ CollectPointInspector node: aNode collector: collector ] ] ].
	^ [ CollectPointInspector node: aNode collector: collector ]