<!-- Welcome.svelte -->
<script lang="ts">
	import { NUI_HANDOVER_DATA } from '@store/stores'
	import { afterUpdate, onMount } from 'svelte'

	let playername: string
	let servername: string
	let sayings: string[]

	NUI_HANDOVER_DATA.subscribe((data) => {
		;(playername = data.playerName),
			(servername = data.serverName),
			(sayings = data.sayings)
	})

	let outputElement: HTMLDivElement

	function replaceStrings(inputString: string) {
		const replacedString = inputString
			.replace(/\{playername\}/g, () => {
				return `<span class="text-blue-500">${playername}</span>`
			})
			.replace(/\{servername\}/g, () => {
				return `<span class="text-blue-500">${servername}</span>`
			})

		return replacedString
	}

	function getRandomSaying() {
		const randomIndex = Math.floor(Math.random() * sayings.length)
		return sayings[randomIndex]
	}

	function updateOutput() {
		const saying = getRandomSaying()
		const modifiedString = replaceStrings(saying)
		const h1Element = document.createElement('h1')
		h1Element.classList.add('text-2xl', 'font-bold')
		h1Element.innerHTML = modifiedString
		outputElement.appendChild(h1Element)
	}

	$: if (outputElement) {
		updateOutput()
	}

	onMount(() => {
		console.log(playername)
	})

	afterUpdate(() => {
		console.log(playername)
	})
</script>

<div
	class="fixed top-0 w-full h-20 bg-gray-600 bg-opacity-40 backdrop-filter backdrop-blur-lg text-white shadow-lg"
>
	<div
		bind:this={outputElement}
		class="container mx-auto flex items-center justify-center h-full"
	></div>
</div>
