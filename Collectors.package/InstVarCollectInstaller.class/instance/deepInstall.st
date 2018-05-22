installing
deepInstall
	(MetalinkTargetResolver slotNamed: varName for: self target option: #all)
		do: [ :instVarNode | self deepInstallOn: instVarNode ]