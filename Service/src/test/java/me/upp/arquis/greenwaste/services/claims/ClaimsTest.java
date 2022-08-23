package me.upp.arquis.greenwaste.services.claims;

import me.upp.arquis.greenwaste.services.utils.Request;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.HttpURLConnection;

import static org.junit.jupiter.api.Assertions.*;

class ClaimsTest {

    private static final String URL = "http://localhost:6969";

    @Test
    public void create() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/claims/create/test@gmail.com/3");
        assertEquals(200, connection.getResponseCode());
    }

    @Test
    public void read() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/claims/read/3");
        assertEquals(200, connection.getResponseCode());
    }

    @Test
    public void readAll() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/claims/readAll");
        assertEquals(200, connection.getResponseCode());
    }
}