package me.upp.arquis.greenwaste.services.points.routes;

import lombok.Data;
import me.upp.arquis.greenwaste.GreenWaste;
import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LInsert;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class PointCreate extends RouteWrapper {

    public PointCreate() {
        super("/points/create/:correo");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String correo = request.params(":correo");

        final String select = new LSelect()
                .from("usuario")
                .value("idUsuario")
                .where("correo", "=", correo)
                .getQuery();
        final String data = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery())).toString();
        System.out.println(data);
        final DataContainer dataContainer = GreenWaste.GSON.fromJson(data, DataContainer[].class)[0];

        final String insert = new LInsert()
                .table("puntos")
                .values(null, dataContainer.getId(), 0)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(insert).execute()));
    }

    @Data
    static class DataContainer {
        private String id;
    }
}
