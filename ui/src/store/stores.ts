import { writable } from "svelte/store";
import { tweened } from 'svelte/motion'

export const actualVolume = writable<number>(0)
export const BROWSER_MODE = writable<boolean>(false);
export const RESOURCE_NAME = writable<string>("");
export const NUI_HANDOVER_DATA = writable({
    playerName: 'playername',
    serverName: 'servername',
    sayings: ['Welcome {playername}! Enjoy your stay at {servername}!'],
    staff: [],
    news: '',
    videoID: ''
})