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
        super("/points/update/:idUsuario/:puntos");
    }

    @Override
    public Object handle (final Request request, final Response response ){
        boolean success = false;
        final int puntos = Integer.parseInt(request.params(":puntos"));
        final String idUsuario = request.params(":idUsuario");
        final String selectPoints = new LSelect()
                .from("puntos")
                .value("*")
                .where("idUsuario", "=", idUsuario)
                .getQuery();
        final String pointsData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectPoints).executeQuery())).toString();
        final PointContainer pointContainer = GreenWaste.GSON.fromJson(pointsData, PointContainer[].class)[0];

        if(pointContainer.puntos >= puntos){
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

}
