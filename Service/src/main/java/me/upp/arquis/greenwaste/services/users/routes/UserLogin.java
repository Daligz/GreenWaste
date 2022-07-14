package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class UserLogin extends RouteWrapper {

    public UserLogin(){

        super("/users/login/:value1/:valueToSearch1/:value2/:valueToSearch2");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String value1 = request.params(":value1");
        final String valueToSearch1 = request.params(":valueToSearch1");
        final String value2 = request.params(":value2");
        final String valueToSearch2 = request.params(":valueToSearch2");
        final String select = new LSelect()
                .from("usuario")
                .value("*")
                .where(value1, "=", valueToSearch1)
                .and(value2, "=", valueToSearch2)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
    }

}
