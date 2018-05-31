visiting
visitBlockNode: node
	node statements do: [ :subnode | subnode acceptVisitor: self ]