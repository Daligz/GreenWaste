package me.upp.arquis.greenwaste.services.points.routes;

import com.google.gson.annotations.SerializedName;
import lombok.Data;
import me.upp.arquis.greenwaste.GreenWaste;
import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.services.claims.routes.ClaimCreate;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LSelect;
import net.royalmind.library.lightquery.queries.LUpdate;
import spark.Request;
import spark.Response;

public class PointUpdate extends RouteWrapper {

    public PointUpdate() {
        super("/points/update/:idUsuario/:puntos/:idPremio");
    }

    @Override
    public Object handle (final Request request, final Response response ){
        boolean success = false;
        final int puntos = Integer.parseInt(request.params(":puntos"));
        final String idPremio = request.params(":idPremio");
        final String idUsuario = request.params(":idUsuario");
        final String selectPoints = new LSelect()
                .from("puntos")
                .value("*")
                .where("idUsuario", "=", idUsuario)
                .getQuery();
        final String pointsData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectPoints).executeQuery())).toString();
        final PointContainer pointContainer = GreenWaste.GSON.fromJson(pointsData, PointContainer[].class)[0];

        final String selectReward = new LSelect()
                .from("premios")
                .value("stock")
                .where("idPremio", "=", idPremio)
                .getQuery();

        final String rewardData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectReward).executeQuery())).toString();
        final RewardContainer rewardContainer = GreenWaste.GSON.fromJson(rewardData, RewardContainer[].class)[0];

        if(rewardContainer.stock > 0){
            if(pointContainer.puntos >= puntos){

                int newStock = rewardContainer.stock - 1;
                final  String updateReward = new LUpdate()
                        .table("premios")
                        .update("stock", newStock)
                        .where("idPremio", "=", idPremio)
                        .getQuery();
                Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(updateReward).execute()));

                final int newPoints = pointContainer.puntos - puntos;
                final String update = new LUpdate()
                        .table("puntos")
                        .update("puntos", newPoints)
                        .where("idPuntos", "=", pointContainer.id)
                        .getQuery();
                Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(update).execute()));
                success = true;
            }else{
                success = false;
            }
            return success;

        }else {
            return "Stock";
        }
    }

    @Data
    static class PointContainer {
        @SerializedName("idpuntos")
        private String id;
        @SerializedName("idusuario")
        private String usuario;
        @SerializedName("puntos")
        private int puntos;
    }

    @Data
    static class RewardContainer {
        @SerializedName("stock")
        private int stock;
    }

}
