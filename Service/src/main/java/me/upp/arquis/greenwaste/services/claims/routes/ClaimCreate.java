package me.upp.arquis.greenwaste.services.claims.routes;

import com.google.gson.annotations.SerializedName;
import lombok.Data;
import me.upp.arquis.greenwaste.GreenWaste;
import me.upp.arquis.greenwaste.database.Connector;
import me.upp.arquis.greenwaste.services.RouteWrapper;
import me.upp.arquis.greenwaste.utils.JsonMapper;
import net.royalmind.library.lightquery.queries.LInsert;
import net.royalmind.library.lightquery.queries.LSelect;
import spark.Request;
import spark.Response;

import java.sql.Date;

public class ClaimCreate extends RouteWrapper {

    public ClaimCreate() {
        super("/claims/create/:correo/:idPremio");
    }

    @Override
    public Object handle(final Request request, final Response response) {
        final String correo = request.params(":correo");
        final String idPremio = request.params(":idPremio");

        final String selectUser = new LSelect()
                .from("usuario")
                .value("idUsuario")
                .where("correo", "=", correo)
                .getQuery();
        final String userData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectUser).executeQuery())).toString();
        final UserContainer userContainer = GreenWaste.GSON.fromJson(userData, UserContainer[].class)[0];

        final String selectPoints = new LSelect()
                .from("puntos")
                .value("idPuntos")
                .where("idUsuario", "=", userContainer.getId())
                .getQuery();
        final String pointsData = Connector.HIKARI_POOL.execute(connection -> JsonMapper.toJSON(connection.prepareStatement(selectPoints).executeQuery())).toString();
        final PointContainer pointContainer = GreenWaste.GSON.fromJson(pointsData, PointContainer[].class)[0];

        // Format : day-month-year
        // new Date(System.currentTimeMillis()).toLocalDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));

        final String insert = new LInsert()
                .table("canjee")
                .values(null, pointContainer.getId(), idPremio, new Date(System.currentTimeMillis()))
                .getQuery();
        return Connector.HIKARI_POOL.execute(connection -> !(connection.prepareStatement(insert).execute()));
    }

    @Data
    static class PointContainer {
        @SerializedName("idpuntos")
        private String id;
    }

    @Data
    static class UserContainer {
        @SerializedName("idusuario")
        private String id;
    }
}
