package me.upp.arquis.greenwaste.services.materials.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LUpdate;
import spark.Request;
import spark.Response;

public class MaterialUpdate extends RouteWrapper {

    public MaterialUpdate() {
        super("/materials/update/:id/:name/:cost");
    }

    @Override
    public Object handle(final Request request, final Response response){
        final String id = request.params(":id");
        final String name = request.params(":name");
        final float cost = Float.parseFloat(request.params(":cost"));

        final String update = new LUpdate()
                .table("material")
                .update("nombre", name)
                .update("costo", cost)
                .where("idMaterial", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(update).execute()));
    }
}
