installing
deepInstall
	(MetalinkTargetResolver
		temporaryNamed: varName
		inMethod: methodName
		for: self target
		option: #write) do: [ :instVarNode | self deepInstallOn: instVarNode ]