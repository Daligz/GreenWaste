package me.upp.arquis.greenwaste.utils;

import lombok.experimental.UtilityClass;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.ResultSet;

@UtilityClass
public class JsonMapper {

    public static JSONArray toJSON(final ResultSet resultSet) {
        try {
            return toJSON(resultSet, -1);
        } catch (final Exception ex) {
            return null;
        }
    }

    public static JSONArray toJSON(final ResultSet resultSet, final int limit) throws Exception {
        int nextLimit = 0;
        final JSONArray jsonArray = new JSONArray();
        while (resultSet.next()) {
            if (limit > 0 && nextLimit >= limit) break;
            final int total_columns = resultSet.getMetaData().getColumnCount();
            final JSONObject obj = new JSONObject();
            for (int i = 0; i < total_columns; i++) obj.put(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultSet.getObject(i + 1));
            jsonArray.put(obj);
            nextLimit++;
        }
        return jsonArray;
    }
}
