installing
installCollectorOn: node
	| installer reifications |
	(node == originalNode and:[originalNode isVariable not]) ifTrue:[^self].
	installer := DeepValueCollectInstaller on: collector.
	installer node: node.
	installer originalNode: originalNode.
	node isVariable ifTrue:[installer control: #before].
	reifications := OrderedCollection new.
	reifications add: (RFLiteralVariableNode value: installer).
	reifications add: installer collectorNode.
	reifications addAll: node availableReifications.
	reifications addIfNotPresent: #value.
	reifications remove: #variable ifAbsent:[].
	installer reifications: reifications.
	installer reinstall.
	installers add: installer