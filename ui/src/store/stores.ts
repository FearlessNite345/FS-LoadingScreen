import { writable } from "svelte/store";
import { tweened } from 'svelte/motion'

export const actualPercent = tweened(0, { duration: 400 })
export const BROWSER_MODE = writable<boolean>(false);
export const RESOURCE_NAME = writable<string>("");