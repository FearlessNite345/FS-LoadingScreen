<script lang="ts">
	import music from '@assets/music.mp3'

	import Welcome from '@components/Welcome.svelte'
	import {
		NUI_HANDOVER_DATA,
		RESOURCE_NAME,
		actualVolume,
	} from '@store/stores'
	import { onMount } from 'svelte'
	import ProgressBar from '@components/ProgressBar.svelte'
	import Staff from '@components/Staff.svelte'
	import News from '@components/News.svelte'

	$RESOURCE_NAME = 'FearlessStudios-LoadingScreen'

	var musicElement = null

	let videoID = 'o9tVz3JbjEs'

	NUI_HANDOVER_DATA.subscribe((data) => {
		console.log(videoID)
		if (data.videoID.length > 0) {
			videoID = data.videoID
			console.log(videoID)
		}
	})

	actualVolume.subscribe((newValue) => {
		if (musicElement) {
			musicElement.volume = newValue
		}
	})

	onMount(() => {
		if (window.nuiHandoverData) {
			NUI_HANDOVER_DATA.set({
				playerName: window.nuiHandoverData.playername,
				serverName: window.nuiHandoverData.servername,
				sayings: window.nuiHandoverData.sayings,
				staff: window.nuiHandoverData.staff,
				news: window.nuiHandoverData.news,
				videoID: window.nuiHandoverData.videoID,
			})

			actualVolume.set(window.nuiHandoverData.volume)
		}
	})
</script>

<div class="relative h-screen bg-black">
	<div class="iframe-container">
		<iframe
			src="https://www.youtube.com/embed/{videoID}?controls=0&amp;showinfo=0&amp;rel=0&amp;autoplay=1&amp;loop=1&amp;mute=1&amp;playlist={videoID}"
			width="1920"
			height="1080"
			title=""
			frameborder="0"
			class="iframe-zoom"
		></iframe>
	</div>

	<div
		class="flex flex-col items-center justify-center absolute top-0 left-0 right-0 bottom-0 z-10"
	>
		<Welcome />
		<Staff />
		<News />
		<ProgressBar />

		<audio bind:this={musicElement} autoplay loop>
			<source src={music} type="audio/mp3" />
			Your browser does not support the audio tag.
		</audio>
	</div>
</div>

<style>
	.iframe-container {
		position: absolute;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
	.iframe-zoom {
		transform: scale(1.15);
	}
</style>
