<!-- Staff.svelte -->
<script lang="ts">
	import { NUI_HANDOVER_DATA } from '@store/stores'

	let staff: Staff[]
	let nostaff = 'No staff to display'

	NUI_HANDOVER_DATA.subscribe((data) => {
		staff = data.staff

		if (staff.length <= 0) {
			staff = []
		}
	})
</script>

<div
	class="bg-gray-800 fixed top-24 left-10 w-80 bg-opacity-40 backdrop-filter backdrop-blur-lg shadow-lg rounded-2xl h-auto max-h-96 flex flex-col"
>
	<div
		class="bg-blue-500 w-full bg-opacity-40 backdrop-filter backdrop-blur-lg shadow-lg rounded-2xl p-4 h-16 flex items-center justify-center"
	>
		<span class="text-white text-3xl font-bold">STAFF</span>
	</div>

	<div class="overflow-y-auto space-y-4 hide-scrollbar p-4">
		{#each staff as member}
			<div
				class="w-full bg-opacity-40 backdrop-filter backdrop-blur-lg shadow-lg rounded-2xl p-4 h-16 flex items-center justify-center"
				style="background-color: {member.color};"
			>
				<div class="flex flex-col items-center">
					<span class="text-white text-2xl font-bold"
						>{member.name}</span
					>
					<span class="text-white text-xs font-bold"
						>{member.rank}</span
					>
				</div>
			</div>
		{/each}

		<div
			class:hidden={staff.length > 0}
			class="overflow-y-auto space-y-4 text-white text-lg font-semibold h-auto hide-scrollbar text-center"
		>
			{nostaff}
		</div>
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
