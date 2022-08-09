package me.upp.arquis.greenwaste.services.containers;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.containers.routes.ContainerRead;
import me.upp.arquis.greenwaste.services.containers.routes.ContainerUpdate;

public class Containers extends Router {

    public Containers(){
        super(
                new ContainerRead(),
                new ContainerUpdate()
        );
    }
}
