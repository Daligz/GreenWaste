package me.upp.arquis.greenwaste.services.rewards.routes;

import me.upp.arquis.greenwaste.GreenWaste;
import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

import java.sql.ResultSet;

public class RewardRead extends RouteWrapper {

    public RewardRead() {
        super("/rewards/read/:id");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String select = new LSelect()
                .from("premios")
                .value("*")
                .where("idPremio", "=", id)
                .getQuery();
        final ResultSet resultSet = Connector.HIKARI_POOL.execute(connection -> connection.prepareStatement(select).executeQuery());
        return GreenWaste.GSON.toJson(resultSet);
    }
}
