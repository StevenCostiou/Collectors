accessing
stop
	<script>
	self allInstances do: [ :a | a stop ].
	app := nil