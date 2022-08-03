appBar: AppBar(
          backgroundColor: Color(0xFF358F80),
          title: Row(
            children: [
              Image.asset(
                "assets/imgs/img_editar_usuario_movil.png",
                fit: BoxFit.contain,
                height: 32,
              ),
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        "Usuario: " + user!.nombre + user!.apellidoPaterno,
                        style: TextStyle(fontSize: 14),
                      )),
                  Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        "Puntos: 48 puntos",
                        style: TextStyle(fontSize: 14),
                      )),
                ],
              ),