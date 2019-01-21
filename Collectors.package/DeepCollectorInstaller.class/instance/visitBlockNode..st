visiting
visitBlockNode: node
	node arguments do: [ :arg | arg acceptVisitor: self ].
	node statements do: [ :subnode | subnode acceptVisitor: self ]