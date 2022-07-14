package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LUpdate;
import spark.Request;
import spark.Response;

public class UserUpdate extends RouteWrapper {

    public UserUpdate() {
        super("/users/update/:id/:nombre/:apPa/:apMa/:tel/:correo/:psw/:idRol");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String nombre = request.params(":nombre");
        final String apPa = request.params(":apPa");
        final String apMa = request.params(":apMa");
        final String tel = request.params(":tel");
        final String correo = request.params(":correo");
        final String psw = request.params(":psw");
        final String update = new LUpdate()
                .table("usuario")
                .update("nombre", nombre)
                .update("apellidoPaterno", apPa)
                .update("apellidoMaterno", apMa)
                .update("telefono", tel)
                .update("correo", correo)
                .update("psw", psw)
                .where("idUsuario", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(update).execute()));
    }
}
