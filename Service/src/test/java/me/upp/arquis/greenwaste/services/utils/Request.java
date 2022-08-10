package me.upp.arquis.greenwaste.services.utils;

import lombok.experimental.UtilityClass;

import java.net.HttpURLConnection;
import java.net.URL;

@UtilityClass
public class Request {

    public HttpURLConnection doRequest(final String url) {
        try {
            final URL urlConn = new URL(url);
            final HttpURLConnection con = (HttpURLConnection) urlConn.openConnection();
            con.setRequestMethod("GET");
            return con;
        } catch (final Exception ignored) { }
        return null;
    }
}