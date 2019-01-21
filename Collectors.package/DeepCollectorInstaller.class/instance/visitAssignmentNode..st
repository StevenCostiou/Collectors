visiting
visitAssignmentNode: node
	node variable acceptVisitor: self.
	node value acceptVisitor: self.
	self installCollectorOn: node