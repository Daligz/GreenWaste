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
    public Object handle(final Request request, final Response response) {
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

        final RewardData[] rewardData = new RewardData[claimData.length];

        final String selectReward = new LSelect()
                .from("premios")
                .value("*")
                .where("idPremio", "=", "%reward")
                .getQuery();

        for (int i = 0; i < claimData.length; i++) {
            final int tempCounter = i;
            final String rewardsData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectReward.replace("%reward", String.valueOf(claimData[tempCounter].getIdPremio()))).executeQuery())).toString();
            rewardData[i] = GreenWaste.GSON.fromJson(
                    rewardsData,
                    RewardData[].class
            )[0];
        }

        int usedPoints = 0;
        for (final RewardData data : rewardData) usedPoints += data.getValue();

        return GreenWaste.GSON.toJson(new GeneralizedClaimData(usedPoints, rewardData));
    }

    @Data
    static class GeneralizedClaimData {
        private final int usedPoints;
        private final RewardData[] rewardData;
    }

    @Data
    static class RewardData {
        @SerializedName("nombre")
        private final String name;
        @SerializedName("descripcion")
        private final String description;
        @SerializedName("imagen")
        private final String image;
        @SerializedName("valor")
        private final int value;
        @SerializedName("stock")
        private final int stock;
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