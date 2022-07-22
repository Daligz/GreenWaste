<template>
  <v-navigation-drawer class="navigation-drawer" v-model="drawer" app>
    <v-img id="img-logo-sidebar" src="../assets/img_logo_web.png"></v-img>
    <div>
      <p id="titulo-sidebar">
        GREEN WASTE
      </p>
    </div>
    <v-divider></v-divider>

    <v-list>
      <div>
        <p id="sub-titulo-sidebar">
          Menu Principal
        </p>
      </div>
      <v-list-item class="hover-item" v-for="[icon, text] in links" :key="icon" link>
        <v-list-item-icon>
          <v-icon class="item-sidebar">{{ icon }}</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="hover-item">
          <v-list-item-title class="item-sidebar-text">{{ text }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

    </v-list>
  </v-navigation-drawer>

</template>
<style>
.navigation-drawer {
  box-shadow: 2px 5px 5px #dfdede;

}

#img-logo-sidebar {
  width: 100%;
}

#titulo-sidebar {
  text-align: center;
  font-size: 28px;
  color: #888888;
}

#sub-titulo-sidebar {
  font-size: 20px;
  color: #888888;
  padding-left: 5%;
}

.item-sidebar {
  font-size: 30px;
}

.item-sidebar-text {
  font-size: 20px;
}

.hover-item:hover {
  color: #fff;
  background-color: #358F80;
  border: 0px solid #358F80;
  border-radius: 40px;
}
</style>
<script>
export default {
  props: ['drawer'],
  name: "sidebar",
  data() {
    return {
      links: [
        ["mdi-account-group-outline", "Usuarios", '/splash'],
        ["mdi-trash-can-outline", "Contenedores"],
        ["mdi-recycle-variant", "Materiales"],
        ["mdi-gift-open-outline", "Premios"],
      ],
    }
  }
}
</script>
<style>
</style>