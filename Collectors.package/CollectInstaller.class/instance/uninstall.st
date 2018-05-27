installing
uninstall
	self deepInstallers do: [ :di | di uninstall ].
	link ifNil: [ ^ self ].
	link uninstall.
	link := nil