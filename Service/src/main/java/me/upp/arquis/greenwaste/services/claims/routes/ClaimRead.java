package me.upp.arquis.greenwaste.services.claims.routes;

import com.google.gson.annotations.SerializedName;
import lombok.Data;
import me.upp.arquis.greenwaste.GreenWaste;
import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

import java.sql.Date;


public class ClaimRead extends RouteWrapper {

    public ClaimRead() {
        super("/claims/read/:idUsuario");
    }

    @Override
    public Object handle(final Request request, final Response response){
        final String idUsuario = request.params(":idUsuario");

        final String selectPoints = new LSelect()
                .from("puntos")
                .value("idPuntos")
                .where("idUsuario", "=", idUsuario)
                .getQuery();
        final String pointsData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectPoints).executeQuery())).toString();
        final PointData pointData = GreenWaste.GSON.fromJson(pointsData, PointData[].class)[0];

        final String selectClaim = new LSelect()
                .from("canjee")
                .value("*")
                .where("idPuntos", "=", pointData.getIdPuntos())
                .and("DATE_FORMAT(fechaCanjee, '%m') = DATE_FORMAT('%date', '%m')".replace("%date", new Date(System.currentTimeMillis()).toString()), "", "")
                .getQuery()
                .replace("''", "");
        final String claimsData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectClaim).executeQuery())).toString();
        final ClaimData[] claimData = GreenWaste.GSON.fromJson(claimsData, ClaimData[].class);

        for (final ClaimData claimDatum : claimData) {
            System.out.println(claimDatum.toString());
        }

        return ":)";
        //return Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(read).executeQuery()));
    }

    @Data
    static class ClaimData {
        @SerializedName("idcanje")
        private final int idCanje;
        @SerializedName("idpuntos")
        private final int idPuntos;
        @SerializedName("idpremio")
        private final int idPremio;
    }

    @Data
    static class PointData {
        @SerializedName("idpuntos")
        private final int idPuntos;
    }
}