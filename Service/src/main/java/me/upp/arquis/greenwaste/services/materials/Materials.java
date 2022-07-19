package me.upp.arquis.greenwaste.services.materials;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.materials.routes.MaterialCreate;
import me.upp.arquis.greenwaste.services.materials.routes.MaterialDelete;
import me.upp.arquis.greenwaste.services.materials.routes.MaterialRead;
import me.upp.arquis.greenwaste.services.materials.routes.MaterialUpdate;

public class Materials extends Router{

    public Materials(){
        super(
                new MaterialCreate(),
                new MaterialDelete(),
                new MaterialRead(),
                new MaterialUpdate()
        );
    }

}
