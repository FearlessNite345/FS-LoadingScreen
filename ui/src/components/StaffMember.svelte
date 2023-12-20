<!-- NewsSection.svelte -->
<script>
	export let name
	export let rank
</script>

<div class="bg-zinc-800 p-4 rounded-md shadow-md mb-4 w-60">
	<h2 class="text-lg font-bold text-blue-500 text-opacity-100">{name}</h2>
	<h2 class="text-sm font-semibold text-white text-opacity-100">{rank}</h2>
</div>
