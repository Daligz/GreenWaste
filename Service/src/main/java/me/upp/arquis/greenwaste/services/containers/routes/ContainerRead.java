package me.upp.arquis.greenwaste.services.containers.routes;

import com.google.gson.annotations.SerializedName;
import lombok.Data;
import me.upp.arquis.greenwaste.GreenWaste;
import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.services.claims.routes.ClaimRead;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

import java.sql.Date;

public class ContainerRead extends RouteWrapper {
    public ContainerRead() {super("/containers/read/:idUsuario");}

    @Override
    public Object handle(final Request request, final Response response) {
        final String idUsuario = request.params(":idUsuario");

        final String select="SELECT contenedor.idContenedor, material.nombre, contenedor.estado FROM ((usuario INNER JOIN direccion ON usuario.idUsuario = direccion.idUsuario) INNER JOIN contenedor ON direccion.idDireccion = contenedor.idDireccion INNER JOIN material ON contenedor.idMaterial = material.idMaterial) WHERE usuario.idUsuario = "+idUsuario+"";
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(select).executeQuery()));
    }
}
