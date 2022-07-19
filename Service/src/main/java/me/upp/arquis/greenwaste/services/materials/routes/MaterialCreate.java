package me.upp.arquis.greenwaste.services.materials.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LInsert;
import spark.Request;
import spark.Response;

public class MaterialCreate extends RouteWrapper {

    public MaterialCreate() {
        super("/materials/create/:name/:cost");
    }

    @Override
    public Object handle(final Request request, final Response response){
        final String name = request.params(":name");
        final int cost = Integer.parseInt(request.params(":cost"));
        final String insert = new LInsert()
                .table("material")
                .values(
                        null, name, cost
                ).getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(insert).execute()));
    }
}
