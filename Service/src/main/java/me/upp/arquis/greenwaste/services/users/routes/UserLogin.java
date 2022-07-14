package me.upp.arquis.greenwaste.services.users.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class UserLogin extends RouteWrapper {

    public UserLogin(){

        super("/users/login/:correo/:correoParametro/:password/:passwordParametro");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String correo = request.params(":/correo");
        final String correoParametro = request.params(":/correoParametro");
        final String password = request.params(":/password");
        final String passwordParametro = request.params("/:passwordParametro");
        final String select = new LSelect()
                .from("usuario")
                .value("*")
                .where(correo, "=", correoParametro)
                .and(password, "=", passwordParametro)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
    }

}
