package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LInsert;
import spark.Request;
import spark.Response;

public class UserCreate extends RouteWrapper {

    public UserCreate() {
        super("/users/create/:nombre/:apPa/:apMa/:tel/:correo/:psw/:idRol");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String nombre = request.params(":nombre");
        final String apPa = request.params(":apPa");
        final String apMa = request.params(":apMa");
        final String tel = request.params(":tel");
        final String correo = request.params(":correo");
        final String psw = request.params(":psw");
        final int idRol = Integer.parseInt(request.params(":idRol"));
        final String insert = new LInsert()
                .table("usuario")
                .values(
                        null, nombre, apPa, apMa, tel, correo, psw, idRol
                )
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> connection.prepareStatement(insert).execute());
    }
}
