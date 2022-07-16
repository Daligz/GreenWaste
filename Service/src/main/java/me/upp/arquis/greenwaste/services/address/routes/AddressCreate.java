package me.upp.arquis.greenwaste.services.address.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LInsert;
import spark.Request;
import spark.Response;

public class AddressCreate extends RouteWrapper {
    public  AddressCreate(){
        super("/address/create/:colonia/:calle/:numero/:municipio/:estado/:latitud/:longuitud/:idUsuario");
    }

    @Override
    public Object handle(Request request, Response response) {
        final String colonia = request.params(":colonia");
        final String calle = request.params(":calle");
        final String  numero = request.params(":numero");
        final String municipio = request.params(":municipio");
        final String estado = request.params(":estado");
        final String latitud = request.params(":latitud");
        final String longuitud = request.params(":longuitud");
        final int idUsuario = Integer.parseInt(request.params(":idUsuario"));
        final String insert = new LInsert()
                .table("direccion")
                .values(null,colonia,calle,numero,municipio,estado,latitud,longuitud,idUsuario)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(insert).execute()));
    }
}
