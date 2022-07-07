package me.upp.arquis.greenwaste.services.rewards.routes;

import me.upp.arquis.greenwaste.services.RouteWrapper;
import spark.Request;
import spark.Response;

public class RewardDelete extends RouteWrapper {

    public RewardDelete() {
        super("/rewards/delete/:id");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        return String.format("Id: %s eliminado!", id);
    }
}
