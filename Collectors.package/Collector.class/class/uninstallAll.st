installing
uninstallAll
	<script>
	Collector allInstancesDo: [ :c | c uninstall ].
	registry := nil