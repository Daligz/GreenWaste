package me.upp.arquis.greenwaste.configuration;

import spark.Filter;
import spark.Spark;

import java.util.HashMap;
import java.util.Map;

public class ServiceConfiguration {

    private final Map<String, String> corsHeaders = new HashMap<>();

    public ServiceConfiguration() {
        corsHeaders.put("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS");
        corsHeaders.put("Access-Control-Allow-Origin", "*");
        corsHeaders.put("Access-Control-Allow-Headers", "Content-Type,Authorization,X-Requested-With,Content-Length,Accept,Origin");
        corsHeaders.put("Access-Control-Allow-Credentials", "true");
    }

    public void apply() {
        final Filter filter = (request, response) -> corsHeaders.forEach(response::header);
        Spark.before(filter);
    }
}
