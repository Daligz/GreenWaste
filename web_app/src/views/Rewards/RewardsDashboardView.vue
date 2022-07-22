<template>
    <v-app id="inspire">
        <header-view @handeDrawer="drawer = !drawer" />
        <main id="content-main">
            <div id="content2-main">
                <sidebar-view :drawer="drawer" />
                <div class="grid-container">
                    <div class="grid-item">
                        <v-img :src="require('@/assets/img_panelPremios_web.png')" class="my-2" contain height="400" />
                    </div>
                    <div class="grid-item">
                        <h1 id="title-panel">PANEL DE CONTROL DE LOS PREMIOS</h1>
                        <v-btn class=" pa-5 cyan darken-3" block dark color="#00B0FF" @click="formNuevo()">
              <v-icon dark>mdi-plus</v-icon>Agregar nuevo usuario
            </v-btn>
                    </div>
                </div>
                <v-card-title>
                    <v-text-field v-model="search" append-icon="mdi-magnify" label="Search" single-line hide-details>
                    </v-text-field>
                </v-card-title>
                <v-data-table :headers="headers" :items="desserts" :search="search"></v-data-table>
            </div>
        </main>
        <footer-vue />
    </v-app>
</template>
<script>
import HeaderView from "@/components/HeaderView.vue";
import SidebarView from "@/components/Sidebar.vue";
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
<style>
#button-Agregar {
    width: 100%;
    font-size: 18px;
    font-weight: bold;
    color: #fff;
    background: #358F80;
    padding: 2.5%;

}
#title-panel {
    font-size: 70px;
    color: #888888;
    display: block;
    margin: auto;
    text-align: center;
    margin: 4% 0% 4% 0%;

}

.grid-container {
    display: grid;
    grid-template-columns: auto auto;
    padding: 10px;
}

.grid-item {
    padding: 20px;
    font-size: 30px;
    text-align: center;
}

.img-logo-dashboard {
    width: 50%;
    display: block;
    margin: auto;
    opacity: .6;
}

#content2-main {
    height: 100%;
    background-color: #fff;
    padding-top: 1%;
    margin: 1%;
}

#content-main {
    background-color: #F8F8F8;
}

.main {
    margin-top: 2%;
    margin-bottom: 2%;
}

#card-content {

    border-style: solid;
    border: 2px solid #888888;
    width: 90%;
    display: block;
    margin: auto;
    padding: 2% 1% 2% 1%;
}
</style>