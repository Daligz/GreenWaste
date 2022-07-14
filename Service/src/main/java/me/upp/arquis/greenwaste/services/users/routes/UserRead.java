package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class UserRead extends RouteWrapper {

    public UserRead() {
        super("/users/read/:id");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String select = new LSelect()
                .from("usuario")
                .value("*")
                .where("idUsuario", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
    }
}
