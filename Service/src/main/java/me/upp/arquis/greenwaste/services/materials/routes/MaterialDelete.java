package me.upp.arquis.greenwaste.services.materials.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LDelete;
import spark.Request;
import spark.Response;

import java.sql.Connection;

public class MaterialDelete extends RouteWrapper {
    public MaterialDelete() {
        super("/materials/delete/:id");
    }

    @Override
    public Object handle(final Request request, final Response response){
        final String id = request.params(":id");
        final String delete = new LDelete()
                .from("material")
                .where("idMaterial", "=", id)
                .getQuery();

        return Connector.HIKARI_POOL.execute(connection -> !connection.prepareStatement(delete).execute());
    }
}
