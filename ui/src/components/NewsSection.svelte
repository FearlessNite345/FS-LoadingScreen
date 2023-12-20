<!-- NewsSection.svelte -->
<script>
	export let title
	export let description
</script>

<div class="bg-zinc-950 bg-opacity-50 p-4 rounded-md shadow-md mb-4 w-96">
	<h2 class="text-lg font-bold text-blue-500 text-opacity-100">{title}</h2>
	<h2 class="text-md font-semibold text-white text-opacity-100">{description}</h2>
</div>
