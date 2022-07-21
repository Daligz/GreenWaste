package me.upp.arquis.greenwaste.services.rewards.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LDelete;
import net.royalmind.library.lightquery.queries.LUpdate;
import spark.Request;
import spark.Response;

public class RewardUpdate extends RouteWrapper {

    public RewardUpdate() {
        super("/rewards/update/:id/:name/:desc/:image/:value/:stock");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String name = request.params(":name");
        final String description = request.params(":desc");
        final String image = request.params(":image");
        final int value = Integer.parseInt(request.params(":value"));
        final int stock = Integer.parseInt(request.params(":stock"));
        final String update = new LUpdate()
                .table("premios")
                .update("nombre", name)
                .update("descripcion", description)
                .update("imagen", image)
                .update("valor", value)
                .update("stock", stock)
                .where("idPremio", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(update).execute()));
    }
}
