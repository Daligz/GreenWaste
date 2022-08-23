package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class UserLoginWeb extends RouteWrapper {
    public UserLoginWeb(){
        super("/users/loginWeb/:correo/:psw/:idrol");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String correo = request.params(":correo");
        final String psw = request.params(":psw");
        final String idrol = request.params(":idrol");
        final String select = new LSelect()
                .from("usuario")
                .value("*")
                .where("correo", "=", correo)
                .and("psw", "=", psw)
                .and("idrol","=",idrol)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
    }
}
