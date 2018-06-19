initialization
initialize
	super initialize.
	reificationsHandler := ReificationsHandler new browser: self.
	allReifications := #(#arguments #receiver #entity #link #name #oldValue #newValue #selector #sender #value #object #class).
	collectorAnnouncer := CollectorAnnouncer new.
	reificationsBindings := OrderedCollection new