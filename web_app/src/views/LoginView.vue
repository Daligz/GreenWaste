<template>
  <main>
    <div class="flex-container">
      <div class="content1-login">
        <v-img class="img-logo-splash" :src="require('../assets/img_logo_web.png')"></v-img>
      </div>
      <div class="content2-longin">
        <h1 class="titulo-splash">BIENVENIDO A GREENWASTE</h1>
        <v-img class="img-login" :src="require('../assets/img_login_web.png')"></v-img>
        <v-text-field class="input-login" filled outlined label="Correo Electronico" prepend-inner-icon="mdi-email"></v-text-field>
        <v-text-field class="input-login" filled outlined label="Contraseña" prepend-inner-icon="mdi-lock"></v-text-field>
        <v-btn id="button-Agregar">Iniciar Sesión</v-btn>
      </div>
    </div>
  </main>
</template>

<style>
.flex-container{
  display: flex;
}
.flex-container>div{
  width: 50%;
}
.content1-login{
  padding: 4%;
  background: rgba(194, 221, 217, 0.74);
}
.img-logo-splash{
  width:100%;
}
.content2-longin{
  padding: 4%;
}
.img-login{
  width: 50%;
  display: block;
  margin: auto;
  margin-bottom: 5%;
}
.titulo-splash{
  font-family: Inter;
  color: #358F80;
  font-size: 50px;
  text-align: center;
  text-shadow: 2px 2px #999;
  margin-bottom: 2%;
}
#button-Agregar {
  width: 100%;
  font-weight: bold;
  color: #fff;
  background: #358F80;
  padding: 3%;
  font-family: Roboto;
  font-size: 18px;
  border-radius: 15px;
  box-shadow: 4px 4px #888888;
}
/* Diseño para celulares */

@media screen and (max-width:480px){
  template {
    float:none;
    width:100%;
  }
}

/* Diseño para tabletas */
@media screen and (min-width: 800px) {
  template {
    float:left;
    width:50%;
  }
}

/* Diseño para PC */
@media screen and (min-width: 1025px) {
  template {
    float: left;
    width: 33%;
  }
}

</style>