<template>
<div class="content-agregarMaterial">
  <hello-world/>
  <agregar-materiales/>
</div>

</template>

<style>
  .content-agregarMaterial{
    margin-top:2%;
    background: #F8F8F8;
  }
</style>

<script>
  import HelloWorld from '../components/HelloWorld'
  import AgregarMateriales from '../components/AgregarMateriales'

  export default {
    name: 'Home',

    components: {
      HelloWorld,
      AgregarMateriales,
    },
   
    
  }
</script>
