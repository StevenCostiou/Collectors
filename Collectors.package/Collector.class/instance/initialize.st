initialization
initialize
	super initialize.
	self configuration: CollectorConfiguration new.
	self isOmniscient: false