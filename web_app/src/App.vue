<template>
  <v-app>
    <v-app-bar app color="white" dark>
      <div class="d-flex align-center">
        <v-img alt="Vuetify Logo" class="shrink mr-2" contain
          src="https://cdn.vuetifyjs.com/images/logos/vuetify-logo-dark.png" transition="scale-transition" width="40" />

        <v-img alt="Vuetify Name" class="shrink mt-1 hidden-sm-and-down" contain min-width="100"
          src="https://cdn.vuetifyjs.com/images/logos/vuetify-name-dark.png" width="100" />
      </div>

      <v-spacer></v-spacer>

      <v-btn href="https://github.com/vuetifyjs/vuetify/releases/latest" target="_blank" text>
        <span class="mr-2">Latest Release</span>
        <v-icon>mdi-open-in-new</v-icon>
      </v-btn>
    </v-app-bar>

    <v-main>
      <router-view />
    </v-main>
    <!---AQUI SE AGREGA EL FOOTER-->
   
<v-footer color="#fff" id="footer">
      <v-card class="flex" flat tile>
        <v-card-title>
          <strong class="subheading footer-text">Green Waste C.V <v-icon>mdi-home-city </v-icon></strong>
          <v-spacer></v-spacer>
            <strong class="subheading footer-text">Pachuca de Soto Hidalgo <v-icon>mdi-crosshairs-gps</v-icon></strong>
        </v-card-title>
      </v-card>
    </v-footer>

    <!---AQUI SE AGREGA EL FOOTER-->
  </v-app>
</template>
<!--AQUI VA LOS ESTILOS DEL FOOTER-->

<style>
.footer-text{
  font-size: 16px;
  color: #888888;
}
</style>

<!--AQUI VA LOS ESTILOS DEL FOOTER-->

<script>

export default {
  name: 'App',

  data: () => ({
    //
  }),
};
</script>
