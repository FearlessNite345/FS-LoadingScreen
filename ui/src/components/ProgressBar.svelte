<!-- ProgressBar.svelte -->
<script>
	export let percent
	export let loadingName
</script>

<div class="fixed bottom-0 w-full">
	<div class="h-3 bg-gray-900"></div>
	<div
		class="h-6 bg-gradient-to-r from-blue-500 via-purple-500 to-green-500 background-animate"
		style="width: {percent}%;"
	></div>
	<div class="bg-gray-900 p-4 h-24 flex items-center justify-between">
		<div>
			<h1 class="text-lg font-semibold text-white">{loadingName}</h1>
		</div>
		<div>
			<h1 class="text-lg font-semibold text-white">{percent}%</h1>
		</div>
	</div>
</div>

<style lang="postcss">
	.background-animate {
		background-size: 400%;

		-webkit-animation: AnimationName 10s ease infinite;
		-moz-animation: AnimationName 10s ease infinite;
		animation: AnimationName 10s ease infinite;
	}

	@keyframes AnimationName {
		0%,
		100% {
			background-position: 0% 50%;
		}
		50% {
			background-position: 100% 50%;
		}
	}
</style>
