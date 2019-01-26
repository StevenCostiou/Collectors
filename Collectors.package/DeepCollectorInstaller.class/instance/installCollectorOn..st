installing
installCollectorOn: node
	| installer reifications |
	(node == originalNode and: [ originalNode isVariable not ])
		ifTrue: [ ^ self ].
	installer := DeepValueCollectInstaller on: collector.
	installer node: node.
	installer originalNode: originalNode.
	node isVariable
		ifTrue: [ installer control: #before ].
	"reifications := OrderedCollection new."
	"	reifications add: (RFLiteralVariableNode value: installer)."
	"	reifications add: installer collectorNode.
	reifications
		addAll:
			(node availableReifications
				select: [ :r | collector installer reifications includes: r ]).

	reifications addIfNotPresent: #value.
	reifications remove: #variable ifAbsent: [  ]."
	reifications := {installer collectorNode.
	#value.
	(RFLiteralVariableNode value: node).
	(RFLiteralVariableNode value: originalNode)} asOrderedCollection.
	(node isVariable or: [ node isAssignment ])
		ifTrue: [ reifications add: #newValue ].
	installer reifications: reifications.
	installer reinstall.
	installers add: installer