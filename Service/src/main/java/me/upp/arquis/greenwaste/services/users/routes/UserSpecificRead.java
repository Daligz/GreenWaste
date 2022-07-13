package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class UserSpecificRead extends RouteWrapper {

    public UserSpecificRead() {
        super("/users/read/:value/:valueToSearch");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String value = request.params(":value");
        final String valueToSearch = request.params(":valueToSearch");
        final String select = new LSelect()
                .from("usuario")
                .value("*")
                .where(value, "=", valueToSearch)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
    }
}
