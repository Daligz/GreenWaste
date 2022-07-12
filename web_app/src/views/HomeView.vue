<template>
  <div class="content-agregarMaterial">

    <splash-view/>
  </div>
</template>
<style>
.content-agregarMaterial {
  margin-top: 2%;
  background: #ffffff;
}
</style>

<script>

import SplashView from "@/views/SplashView";

export default {
  name: 'Home',

  components: {
    SplashView,
  },
}
</script>
