package me.upp.arquis.greenwaste.services.containers.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LInsert;
import spark.Request;
import spark.Response;

public class ContainerCreate extends RouteWrapper {

    public ContainerCreate() {
        super("/containers/create/:idMaterial/:idDireccion/:estado");
    }

    @Override
    public Object handle(final Request request, final Response response){
        final int idMaterial = Integer.parseInt(request.params(":idMaterial"));
        final int idDireccion = Integer.parseInt(request.params(":idDireccion"));
        final String estado = request.params(":estado");

        final String insert = new LInsert()
                .table("contenedor")
                .values(
                        null, idMaterial, idDireccion, estado
                )
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(insert).execute()));
    }


}
