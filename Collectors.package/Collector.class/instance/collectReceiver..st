collecting api
collectReceiver: node
	installer := ReceiverCollectInstaller on: self.
	installer node: node.
	installer install