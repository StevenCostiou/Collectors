visiting
visitMessageNode: node
	node receiver acceptVisitor: self.
	node arguments do: [ :arg | arg acceptVisitor: self ].
	self installCollectorOn: node