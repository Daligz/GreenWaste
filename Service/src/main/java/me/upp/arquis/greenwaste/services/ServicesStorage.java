package me.upp.arquis.greenwaste.services;

import me.upp.arquis.greenwaste.storages.Storage;

public class ServicesStorage extends Storage<Service> {

    public ServicesStorage(final Service... services) {
        this.add(services);
    }

    public void run() {
        this.get().forEach(Service::run);
    }
}
