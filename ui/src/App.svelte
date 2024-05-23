<script lang="ts">
	import loadingVideo from '@assets/server.mp4'
	import music from '@assets/music.mp3'

	import Welcome from '@components/Welcome.svelte'
	import {
		NUI_HANDOVER_DATA,
		RESOURCE_NAME,
		actualPercent,
		actualVolume,
	} from '@store/stores'
	import { onMount } from 'svelte'
	import ProgressBar from '@components/ProgressBar.svelte'

	$RESOURCE_NAME = 'FearlessStudios-LoadingScreen'

	$: percent = 0
	$: loadingName = 'Loading...'
	var musicElement = null

	actualVolume.subscribe(newValue => {
		if (musicElement) {
			musicElement.volume = newValue
		}
	})

	onMount(() => {
		actualPercent.set(percent)

		window.addEventListener('message', function (e) {
			var data = e.data
			if (data.eventName === 'loadProgress') {
				percent = Math.round(data.loadFraction * 100)
				actualPercent.set(percent)
			} else if (data.eventName === 'onLogLine') {
				loadingName = data.message
			} else {
				if (data.name != null) {
					loadingName = 'Loading: ' + data.name
				}
			}
		})

		if (window.nuiHandoverData) {
			NUI_HANDOVER_DATA.set({
				playerName: window.nuiHandoverData.playername,
				serverName: window.nuiHandoverData.serverName,
				sayings: window.nuiHandoverData.sayings,
			})

			actualVolume.set(window.nuiHandoverData.volume)
		}
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
		<Welcome />
		<ProgressBar {percent} {loadingName} />

		<audio bind:this={musicElement} autoplay loop>
			<source src={music} type="audio/mp3" />
			Your browser does not support the audio tag.
		</audio>
	</div>
</div>
