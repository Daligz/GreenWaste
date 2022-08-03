package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import spark.Request;
import spark.Response;

public class UserReadWeb  extends RouteWrapper {

    public UserReadWeb(){
        super("/users/readAdmin");
    }

    @Override
    public Object handle(Request request, Response response) {
        final String select="SELECT usuario.idUsuario,usuario.nombre, usuario.apellidoPaterno, usuario.apellidoMaterno,usuario.telefono, usuario.correo, usuario.psw, usuario.idRol, rol.rol FROM usuario INNER JOIN rol ON usuario.idRol=rol.idRol WHERE usuario.idRol=2";
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
    }
}
