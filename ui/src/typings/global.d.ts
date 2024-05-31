export {};

declare global {
  interface Window {
    nuiHandoverData: NuiHandoverData;
  }

  interface NuiHandoverData {
    playername: string,
    servername: string,
    sayings: string[],
    staff: Staff[],
    news: string,
    volume: number,
    videoID: string
  }

  interface Staff {
    name: string,
    rank: string,
    color: string
}
}