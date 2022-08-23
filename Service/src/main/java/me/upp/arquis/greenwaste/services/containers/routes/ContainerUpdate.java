package me.upp.arquis.greenwaste.services.containers.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LUpdate;
import spark.Request;
import spark.Response;

public class ContainerUpdate extends RouteWrapper {

    public ContainerUpdate() {
        super("/containers/update/:id/:status");
    }

    public Object handle(final Request request, final Response response) {
        final String id = request.params(":id");
        final String status = request.params(":status");

        final String update = new LUpdate()
                .table("contenedor")
                .update("estado", status)
                .where("idContenedor", "=", id)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(update).execute()));
    }
}
