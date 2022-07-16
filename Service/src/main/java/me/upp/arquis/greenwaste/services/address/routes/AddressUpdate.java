package me.upp.arquis.greenwaste.services.address.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import net.royalmind.library.lightquery.queries.LUpdate;
import spark.Request;
import spark.Response;

public class AddressUpdate extends RouteWrapper {
    public  AddressUpdate(){
        super("/address/update/:idDireccion/:colonia/:calle/:numero/:municipio/:estado/:latitud/:longitud/:idUsuario");
    }

    @Override
    public Object handle(Request request, Response response) {
        final  String idDireccion = request.params(":idDireccion");
        final String colonia = request.params(":colonia");
        final String calle = request.params(":calle");
        final String  numero = request.params(":numero");
        final String municipio = request.params(":municipio");
        final String estado = request.params(":estado");
        final String latitud = request.params(":latitud");
        final String longitud = request.params(":longitud");
        final int idUsuario = Integer.parseInt(request.params(":idUsuario"));
        final String update = new LUpdate()
                .table("direccion")
                .update("colonia",colonia)
                .update("calle",calle)
                .update("numero",numero)
                .update("municipio",municipio)
                .update("estado",estado)
                .update("latitud",latitud)
                .update("longitud",longitud)
                .where("idDireccion","=", idDireccion)
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(update).execute()));

    }
}
