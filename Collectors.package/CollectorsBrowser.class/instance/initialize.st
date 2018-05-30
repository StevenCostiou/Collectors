initialization
initialize
	super initialize.
	reificationsHandler := ReificationsHandler new browser: self.
	allReifications := #(#arguments #receiver #entity #link #name #oldValue #newValue #selector #sender #value #object #class).
	self wantsAutomaticRefresh: true.
	announcer := CollectorAnnouncer new.