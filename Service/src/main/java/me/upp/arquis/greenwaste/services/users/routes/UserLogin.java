package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import org.json.JSONArray;
import spark.Request;
import spark.Response;

public class UserLogin extends RouteWrapper {

    public UserLogin(){

        super("/users/login/:correo/:psw");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String correo = request.params(":correo");
        final String psw = request.params(":psw");
        final String select = new LSelect()
                .from("usuario")
                .value("*")
                .where("correo", "=", correo)
                .and("psw", "=", psw)
                .getQuery();

        //return Connector.HIKARI_POOL.execute(connection -> {
            //final JSONArray objects = JsonMapper.toJSON(connection.prepareStatement(select).executeQuery());
            //return (objects != null && !(objects.isEmpty()));
            return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
        //});
    }
}
