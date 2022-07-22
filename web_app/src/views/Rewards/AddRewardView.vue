<template>
    <v-app id="inspire">
        <header-view @handeDrawer="drawer = !drawer" />
        <main id="content-main">
            <div id="content2-main">
                <sidebar-view :drawer="drawer" />
                <v-form v-model="valid" id="card-content">
                    <h1 class="titulo-fomulario">AGREGA EL PREMIO A CANJEAR</h1>
                    <v-img :src="require('@/assets/img_agregarPremio_web.png')" class="my-2" contain height="400" />
                    <v-row>
                        <v-col cols="12" md="6">
                            <v-text-field filled outlined label="Nombre del premio" prepend-inner-icon="mdi-gift"></v-text-field>
                        </v-col>
                        <v-col cols="12" md="6">
                            <v-text-field filled outlined label="Valor por puntos"
                                prepend-inner-icon="mdi-cash-multiple">
                            </v-text-field>
                            <v-text-field filled outlined label="Nombre del premio"
                                prepend-inner-icon="mdi-gift-open-outline">
                            </v-text-field>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="12" md="6">
                            <v-text-field filled outlined label="Nombre del premio"
                                prepend-inner-icon="mdi-gift-open-outline">
                            </v-text-field>
                        </v-col>

                        <v-col cols="12" md="6">
                            <v-file-input label="Seleccione la imagen" filled outlined prepend-inner-icon="mdi-camera">
                            </v-file-input>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="12" md="12">
                            <v-textarea name="input-7-1" filled outlined label="Ingrese una secripción del producto"
                                prepend-inner-icon="mdi-book-open-variant" auto-grow>
                            </v-textarea>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col cols="12" md="6">
                            <v-btn id="button-Agregar">
                                <v-icon left color="#ffffff">mdi-plus-box</v-icon>Agregar Material
                            </v-btn>
                        </v-col>
                        <v-col cols="12" md="6">
                            <v-btn id="button-Cancelar" class=" rounded">
                                <v-icon left>mdi-reply</v-icon>Cancelar
                            </v-btn>
                        </v-col>
                    </v-row>
                </v-form>
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

.titulo-fomulario {
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    font-size: 50px;
    opacity: 0.6;
    text-align: center;
}

#button-Agregar {
    width: 100%;
    font-weight: bold;
    color: #fff;
    background: #358F80;
    padding: 3%;
}

#button-Cancelar {
    width: 100%;
    font-weight: bold;
    color: #fff;
    background: #FFC107;
    padding: 3%;

}

#button-Cancelar:hover {
    color: #FFC107;
    background: #fff;
    border-style: solid;
    border-color: #FFC107;
}

#button-Agregar:hover {
    color: #358F80;
    background: #fff;
    border-style: solid;
    border-color: #358F80;
}
</style>