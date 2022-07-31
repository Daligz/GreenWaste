package me.upp.arquis.greenwaste.services.address.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class AddressRead extends RouteWrapper {
    public  AddressRead(){
        super("/address/read/:idUsuario");
    }

    @Override
    public Object handle(Request request, Response response) {
        final String idUsuario = request.params(":idUsuario");
        final String select = new LSelect()
                .from("direccion")
                .value("*")
                .where("idUsuario","=",idUsuario)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> (JsonMapper.toJSON(connection.prepareStatement(select).executeQuery())));
    }
}
