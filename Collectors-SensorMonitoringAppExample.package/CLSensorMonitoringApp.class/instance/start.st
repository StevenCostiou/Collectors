start/stop
start
	| delay |
	delay := 100 milliSeconds asDelay.
	running := true.
	process := [ [ running ]
		whileTrue: [ | stream |
			stream := WriteStream on: String new.
			errors
				do: [ :err | 
					stream nextPutAll: err.
					stream cr ].
			stream nextPutAll: '##########################################'.
			stream cr.
			sensors
				do: [ :sensor | 
					[ sensor printNextReadOn: stream ]
						on: Error
						do: [ :err | self logError: sensor -> err ] ].
			Transcript clear.
			Transcript crShow: stream contents.
			delay wait ] ] fork