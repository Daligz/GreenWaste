package me.upp.arquis.greenwaste.services.address.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LDelete;
import spark.Request;
import spark.Response;

public class AddresDelete extends RouteWrapper {
    public AddresDelete() {
        super("/address/delete/:idDireccion");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String idDireccion = request.params(":idDireccion");
        final String delete = new LDelete()
                .from("direccion")
                .where("idDireccion", "=", idDireccion)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(delete).execute()));
    }
}
