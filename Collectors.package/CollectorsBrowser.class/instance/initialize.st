initialization
initialize
	super initialize.
	reificationsHandler := ReificationsHandler new browser: self.
	allReifications := #(#arguments #receiver #entity #link #name #oldValue #newValue #selector #sender #value #object #class).
	announcer := CollectorAnnouncer new.
	reificationsBindings := OrderedCollection new