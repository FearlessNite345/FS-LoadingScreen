<!-- ProgressBar.svelte -->
<script>
	let percent = 0
	let loadingName = 'Loading ...'

	window.addEventListener('message', function (e) {
			var data = e.data
			if (data.eventName === 'loadProgress') {
				percent = Math.round(data.loadFraction * 100)
			} else if (data.eventName === 'onLogLine') {
				loadingName = data.message
			} else {
				if (data.name != null) {
					loadingName = 'Loading: ' + data.name
				}
			}
		})
</script>

<div
	class="fixed bottom-0 w-full h-20 bg-gray-600 bg-opacity-40 backdrop-filter backdrop-blur-lg text-white shadow-lg p-4 flex items-center justify-between"
>
	<h1 class="text-lg font-semibold text-white">{loadingName}</h1>
	<h1 class="text-lg font-semibold text-white">{percent}%</h1>
</div>

<style lang="postcss">

</style>
