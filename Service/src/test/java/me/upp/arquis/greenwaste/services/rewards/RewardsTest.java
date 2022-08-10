package me.upp.arquis.greenwaste.services.rewards;

import me.upp.arquis.greenwaste.services.utils.Request;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.HttpURLConnection;

import static org.junit.jupiter.api.Assertions.assertEquals;

class RewardsTest {

    private static final String URL = "http://localhost:6969";

    @Test
    public void create() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/rewards/create/test/descTest/imageTest/0/0");
        assertEquals(200, connection.getResponseCode());
    }

    @Test
    public void read() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/rewards/read");
        assertEquals(200, connection.getResponseCode());
    }

    @Test
    public void update() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/rewards/update/2/testEdit/descEdit/imageEdit/1/1");
        assertEquals(200, connection.getResponseCode());
    }

    @Test
    public void delete() throws IOException {
        final HttpURLConnection connection = Request.doRequest(URL + "/rewards/delete/3");
        assertEquals(200, connection.getResponseCode());
    }
}