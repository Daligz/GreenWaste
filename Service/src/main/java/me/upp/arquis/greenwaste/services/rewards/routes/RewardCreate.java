package me.upp.arquis.greenwaste.services.rewards.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LInsert;
import spark.Request;
import spark.Response;

public class RewardCreate extends RouteWrapper {

    public RewardCreate() {
        super("/rewards/create/:name/:desc/:image/:value/:stock");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String name = request.params(":name");
        final String description = request.params(":desc");
        final String image = request.params(":image");
        final int value = Integer.parseInt(request.params(":value"));
        final int stock = Integer.parseInt(request.params(":stock"));
        final String insert = new LInsert()
                .table("premios")
                .values(
                        null, name, description, image, value, stock
                ).getQuery();
        return Connector.HIKARI_POOL.execute(connection -> connection.prepareStatement(insert).execute());
    }
}
