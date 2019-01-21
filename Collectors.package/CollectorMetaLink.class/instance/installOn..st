installing
installOn: aNode
	super installOn: aNode.
	aNode setCollector: collector.
	collector notifyInstallationOn: aNode