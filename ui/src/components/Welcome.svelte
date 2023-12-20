<!-- Welcome.svelte -->
<script>
    export let name;
  </script>
  
  <div class="fixed top-0 left-0 w-full h-24 bg-gray-900 text-white">
    <div class="container mx-auto flex items-center justify-center h-full">
      <h1 class="text-3xl font-bold">Welcome <span class="text-blue-500">{name}</span>!</h1>
    </div>
  </div>
  