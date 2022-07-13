package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LDelete;
import net.royalmind.library.lightquery.queries.LInsert;
import spark.Request;
import spark.Response;

public class UserDelete extends RouteWrapper {

    public UserDelete() {
        super("/users/delete/:id");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String delete = new LDelete()
                .from("usuario")
                .where("idUsuario", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(delete).execute()));
    }
}
