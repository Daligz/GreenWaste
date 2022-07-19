package me.upp.arquis.greenwaste.services.materials.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;


public class MaterialRead extends RouteWrapper {

    public MaterialRead() {
        super("/materials/read/:id");
    }

    @Override
    public Object handle(final Request request, final Response response){
        final String id = request.params(":id");
        final String read = new LSelect()
                .from("material")
                .value("*")
                .where("idMaterial", "=", id)
                .getQuery();

        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(read).executeQuery()));
    }
}
