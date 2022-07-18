<template>
  <v-container>
    <v-form>
      <div id="card-content" class="pa-10">
          <h1 class="titulo-fomulario">AGREGAR MATERIAL</h1>
          <v-img :src="require('../assets/img_formulario_agregarMateriales.png')" class="my-2" contain height="400" />
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field filled outlined label="Nombre del Material" prepend-inner-icon="mdi-recycle-variant">
            </v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field filled outlined label="Precio por Kilogramo" prepend-inner-icon="mdi-cash"></v-text-field>
          </v-col>
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
      </div>
      </v-form>
  </v-container>
</template>
<style>
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

#card-content {

  border-style: solid;
  border: 2px solid #888888;
  width: 95%;
  display: block;
  margin: auto;
}
</style>
<script>
export default {
  name: 'AgregarMatriales',

  data: () => ({
    ecosystem: [
    ]
  }),
}
</script>