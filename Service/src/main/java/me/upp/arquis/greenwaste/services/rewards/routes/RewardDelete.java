package me.upp.arquis.greenwaste.services.rewards.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LDelete;
import spark.Request;
import spark.Response;

public class RewardDelete extends RouteWrapper {

    public RewardDelete() {
        super("/rewards/delete/:id");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String delete = new LDelete()
                .from("premios")
                .where("idPremio", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(delete).execute()));
    }
}
