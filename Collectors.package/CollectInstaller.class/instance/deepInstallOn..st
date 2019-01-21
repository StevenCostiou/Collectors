installing
deepInstallOn: aNode
	| collector deepInstaller |
	collector := self collectorNode binding value.
	deepInstaller := DeepCollectorInstaller new.
	deepInstaller collector: collector.
	deepInstaller originalNode: aNode.
	deepInstaller deepInstall.
	self deepInstallers add: deepInstaller