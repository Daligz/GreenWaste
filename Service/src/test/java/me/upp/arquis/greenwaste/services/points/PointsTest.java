package me.upp.arquis.greenwaste.services.points;

import me.upp.arquis.greenwaste.services.utils.Request;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.HttpURLConnection;

import static org.junit.jupiter.api.Assertions.*;

class PointsTest {

    private static final String URL = "http://localhost:6969";

    @Test
    public void create() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/points/create/test@gmail.com");
        assertEquals(200, connection.getResponseCode());
    }

    @Test
    public void read() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/points/read/3");
        assertEquals(200, connection.getResponseCode());
    }

    @Test
    public void update() { }
}