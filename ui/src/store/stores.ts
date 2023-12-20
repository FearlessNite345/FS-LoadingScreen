import { writable } from "svelte/store";

export const BROWSER_MODE = writable<boolean>(false);
export const RESOURCE_NAME = writable<string>("");