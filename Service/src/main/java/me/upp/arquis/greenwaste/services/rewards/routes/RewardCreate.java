package me.upp.arquis.greenwaste.services.rewards.routes;

import me.upp.arquis.greenwaste.services.RouteWrapper;
import spark.Request;
import spark.Response;

public class RewardCreate extends RouteWrapper {

    public RewardCreate() {
        super("/rewards/create/:id/:name");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String name = request.params(":name");
        return String.format("Id: %s - name: %s", id, name);
    }
}
