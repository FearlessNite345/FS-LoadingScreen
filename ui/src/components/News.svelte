<!-- News.svelte -->
<script lang="ts">
	import { NUI_HANDOVER_DATA } from '@store/stores'

	let news: string
    let nonews = 'No updates/news to display'

	NUI_HANDOVER_DATA.subscribe((data) => {
		news = data.news

        if (news.length <= 0) {
            news = nonews
        }
	})
</script>

<div
	class="bg-gray-800 fixed top-24 right-10 w-80 bg-opacity-40 backdrop-filter backdrop-blur-lg shadow-lg rounded-2xl p-4 h-auto max-h-96"
>
	<div
		class="bg-blue-500 fixed top-0 right-0 w-full bg-opacity-40 backdrop-filter backdrop-blur-lg shadow-lg rounded-2xl p-4 h-16 flex items-center justify-center"
	>
		<span class="text-white text-3xl font-bold">UPDATES / NEWS</span>
	</div>

	<div
		class="overflow-y-auto mt-16 space-y-4 text-white text-lg font-semibold h-auto hide-scrollbar text-center"
	>
		{news}
	</div>
</div>

<style>
	/* Hide scrollbar for Chrome, Safari and Opera */
	.hide-scrollbar::-webkit-scrollbar {
		display: none;
	}

	/* Hide scrollbar for IE, Edge and Firefox */
	.hide-scrollbar {
		-ms-overflow-style: none; /* IE and Edge */
		scrollbar-width: none; /* Firefox */
	}
</style>
