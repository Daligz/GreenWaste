package me.upp.arquis.greenwaste.services;

import me.upp.arquis.greenwaste.storages.Storage;

public class ServicesStorage extends Storage<Service> {

    public ServicesStorage(final Service... services) {
        this.add(services);
        System.out.println("Iniciando servicios...");
        this.run();
        System.out.println("Servicios listos! ;)");
    }

    private void run() {
        this.get().forEach(Service::run);
    }
}
