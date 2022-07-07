package me.upp.arquis.greenwaste.services;

import lombok.AllArgsConstructor;
import lombok.Getter;
import spark.Request;
import spark.Response;
import spark.Route;

@AllArgsConstructor
public abstract class RouteWrapper implements Route {

    @Getter
    private final String path;

    @Override
    public Object handle(final Request request, final Response response) {
        return null;
    }
}
