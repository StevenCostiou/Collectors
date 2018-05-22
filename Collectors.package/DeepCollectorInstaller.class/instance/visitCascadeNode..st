visiting
visitCascadeNode: node
	self flag: 'doute ici : la visite des messages revisitent les receveurs...'.
	node messages do: [ :m | m acceptVisitor: self ]