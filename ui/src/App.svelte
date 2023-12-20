<!-- App.svelte -->

<script lang="ts">
	import loadingVideo from './assets/loadingScreen.mp4'
	import logo from './assets/logo.png'
	import music from './assets/music.mp3'

	import Welcome from '@components/Welcome.svelte'
	import { RESOURCE_NAME } from '@store/stores'
	import { onMount } from 'svelte'
	import ProgressBar from '@components/ProgressBar.svelte'
	import NewsSection from '@components/NewsSection.svelte'
	import StaffMember from '@components/StaffMember.svelte'

	$RESOURCE_NAME = 'FearlessStudios-LoadingScreen' // Change this to your resource name (case sensitive)

	$: percent = 100
	$: loadingName = 'Loading...'
	$: name = 'Name'
	$: staffMembers = []
	$: news = []
	$: showLogo = false
	var musicElement = null

	onMount(() => {
		musicElement.volume = 0.1

		window.addEventListener('message', function (e) {
			var data = e.data
			if (data.eventName === 'loadProgress') {
				percent = Math.round(data.loadFraction * 100)
			} else if (data.eventName === 'onLogLine') {
				loadingName = data.message
			} else {
				if (data.name != null) {
					loadingName = data.name
				}
			}
		})

		name = window.nuiHandoverData.name
		staffMembers = window.nuiHandoverData.staffMembers
		news = window.nuiHandoverData.news
		showLogo = window.nuiHandoverData.showLogo
	})
</script>

<div class="relative h-screen bg-black">
	<video
		autoplay
		muted
		loop
		class="object-cover w-full h-full fixed top-0 left-0 z-0"
	>
		<source src={loadingVideo} type="video/mp4" />
		Your browser does not support the video tag.
	</video>

	<div
		class="flex flex-col items-center justify-center absolute top-0 left-0 right-0 bottom-0 z-10"
	>
		<img
			class:hidden={!showLogo}
			src={logo}
			alt="Server Logo"
			class="w-1/4 -translate-y-5"
		/>

		<Welcome {name} />
		<ProgressBar {percent} {loadingName} />

		<div
			class="bg-zinc-950 space-y-5 fixed rounded bg-opacity-50 p-5 left-10 top-28 flex flex-col"
			class:hidden={staffMembers.length === 0}
		>
			<h1 class="text-blue-500 font-bold text-4xl text-center">Staff</h1>
			{#each staffMembers as member}
				<StaffMember name={member.name} rank={member.rank} />
			{/each}
		</div>

		<div
			class="bg-zinc-950 space-y-5 fixed rounded bg-opacity-50 p-5 right-10 top-28 flex flex-col"
			class:hidden={news.length === 0}
		>
			<h1 class="text-blue-500 font-bold text-4xl text-center">News</h1>
			{#each news as item}
				<NewsSection
					title={item.title}
					description={item.description}
				/>
			{/each}
		</div>

		<audio bind:this={musicElement} autoplay loop>
			<source src={music} type="audio/mp3" />
			Your browser does not support the audio tag.
		</audio>
	</div>
</div>

<style>
	/* Add your own custom styles here */
</style>
