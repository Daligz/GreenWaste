package me.upp.arquis.greenwaste;

import me.upp.arquis.greenwaste.services.Service;
import me.upp.arquis.greenwaste.services.ServicesStorage;
import me.upp.arquis.greenwaste.storages.Storage;

public class GreenWaste {

    public static void main(final String[] args) {
        final Storage<Service> services = new ServicesStorage(
                // Add here all services
        );
    }
}
