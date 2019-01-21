accessing
start
	<script>
	app ifNil: [ app := self new ].
	app stop.
	app start