package me.upp.arquis.greenwaste.services.claims.routes;

import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

public class ClaimReadAll extends RouteWrapper {

    public ClaimReadAll() {
        super("/claims/readAll");
    }

    @Override
    public Object handle (final Request request, final Response response) {
        final String prueba = "SELECT canjee.idCanje, usuario.nombre as NombreUsuario, premios.nombre as NombrePremio, canjee.fechaCanjee FROM canjee\n" +
                "INNER JOIN puntos ON canjee.idPuntos = puntos.idPuntos\n" +
                "INNER JOIN premios ON canjee.idPremio = premios.idPremio\n" +
                "INNER JOIN usuario ON puntos.idUsuario = usuario.idUsuario";
        return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(prueba).executeQuery()));
    }
}
