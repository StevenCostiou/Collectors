installing
collectVariableObject: node
	scopeType := self tempVarScopeType.
	self installMetaLinkOn: node reifying: self arguments