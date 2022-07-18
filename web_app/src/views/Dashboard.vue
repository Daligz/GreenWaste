<template>
  <v-app id="inspire">
    <header-view @handeDrawer="drawer = !drawer" />
    <main id="content-main" >
      <div id="content2-main">
        <sidebar-view :drawer="drawer"/>
      <h1 id="bienvenida">BIENVENIDO, QUE TENGA UN EXCELENTE DÍA</h1>
      <v-img class="img-logo-dashboard" :src="require('../assets/img_logo_web.png')"></v-img>
      </div>
    </main>
    <footer-vue/>
  </v-app>
</template>
<style>
#bienvenida{
  text-align: center;
  padding-top: 2%;
  color: #888;
  font-family: Arial, Helvetica, sans-serif;
}
.img-logo-dashboard{
  width: 50%;
  display: block;
  margin: auto;
  opacity: .6;
}
#content2-main{
  height: 100%;
  background-color: #fff;
  padding-top: 1%;
  margin: 1%;
}
#content-main{
  background-color: #F8F8F8;
}
.main{
  margin-top: 2%;
  margin-bottom: 2%;
}
</style>
<script>
import HeaderView from "../components/HeaderView.vue";
import SidebarView from "../components/Sidebar.vue";
import FooterVue from "@/components/Footer.vue";

export default {
    data: () => ({
        cards: ["Today", "Yesterday"],
        drawer: true,
        links: [
            ["mdi-inbox-arrow-down", "Inbox"],
            ["mdi-send", "Send"],
            ["mdi-delete", "Trash"],
            ["mdi-alert-octagon", "Spam"],
        ],
    }),
    components: { 
      HeaderView, 
      SidebarView, 
      FooterVue, 
      
    }
}
</script>