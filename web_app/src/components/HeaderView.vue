<template>
  <v-app-bar class="app-bar" app color="white" >
      <v-app-bar-nav-icon @click="$emit('handeDrawer')"></v-app-bar-nav-icon>
      <v-toolbar-title id="title-header">DASHBOARD</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-avatar color="primary" size="56">
        <v-img id="img-header" src="../assets/img_login_web.png"></v-img>
      </v-avatar>
      <v-div class="credentiales">
        <p>Saul Camacho Lopez <br>Administrador</p>
      </v-div>
    </v-app-bar>
</template>
<style>
.credentiales{
  margin-left: 1%;
  margin-top: 1%;
}
#img-header{
  width: 20px;
}
#title-header{
  font-size: 25px;
  color: #888;
}
.app-bar{
  margin-left: 2px;
 box-shadow: 10px 5px 5px black;
}
</style>
<script>

</script>