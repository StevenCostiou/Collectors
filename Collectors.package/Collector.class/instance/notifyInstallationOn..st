installing
notifyInstallationOn: aNode
	self isOmniscient
		ifFalse: [ ^ self ].
	installer deepInstallOn: aNode