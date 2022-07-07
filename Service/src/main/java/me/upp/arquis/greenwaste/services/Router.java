package me.upp.arquis.greenwaste.services;

import lombok.Getter;
import spark.Spark;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract class Router implements Service {

    @Getter
    private final List<RouteWrapper> routes = new ArrayList<>();

    public Router(final RouteWrapper... wrappers) {
        this.routes.addAll(Arrays.asList(wrappers));
    }

    @Override
    public void run() {
        final String className = this.getClass().getSimpleName();
        System.out.printf("Cargando el enrutador %s...%n", className);
        this.routes.forEach(routeWrapper -> {
            System.out.printf("  < [%s] > Iniciando el servicio %s...%n", className, routeWrapper.getClass().getSimpleName());
            Spark.get(routeWrapper.getPath(), routeWrapper);
        });
    }
}
