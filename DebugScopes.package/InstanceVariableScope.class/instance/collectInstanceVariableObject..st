installing
collectInstanceVariableObject: node
	scopeType := self instVarScopeType.
	self installMetaLinkOn: node reifying: self arguments