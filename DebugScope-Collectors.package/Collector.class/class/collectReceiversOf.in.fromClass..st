as yet unclassified
collectReceiversOf: messageSelector in: methodName fromClass: className
	(((Smalltalk at: className) >> methodName) ast allChildren
		select: [ :n | n isMessage and: [ n selector = messageSelector ] ])
		do: [ :node | 
			| collector |
			collector := VariableScope new.
			collector collectReceiverObject: node.
			self collectors add: collector ].
	DebugScopeGlobalAnnouncer default announce: ObjectCollectorHasChanged.
	^ collectors