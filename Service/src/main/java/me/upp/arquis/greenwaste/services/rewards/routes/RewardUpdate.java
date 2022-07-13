package me.upp.arquis.greenwaste.services.rewards.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LDelete;
import net.royalmind.library.lightquery.queries.LUpdate;
import spark.Request;
import spark.Response;

public class RewardUpdate extends RouteWrapper {

    public RewardUpdate() {
        super("/rewards/update/:id/:value/:valueToUpdate");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String value = request.params(":value");
        final String valueToUpdate = request.params(":valueToUpdate");
        final String update = new LUpdate()
                .table("premios")
                .update(value, valueToUpdate)
                .where("idPremio", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(update).execute()));
    }
}
