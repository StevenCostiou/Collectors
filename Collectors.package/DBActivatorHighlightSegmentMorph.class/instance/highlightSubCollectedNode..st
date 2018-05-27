highlighting
highlightSubCollectedNode: node
	self color: (Color green alpha: 0.35).
	self borderStyle: (self theme rubScrolledTextMorphThemer highlightBorderStyleFor: textArea).
	self borderColor: Color green muchDarker.
	self borderWidth: 1.
	