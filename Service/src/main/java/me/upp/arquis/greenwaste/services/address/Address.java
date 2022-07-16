package me.upp.arquis.greenwaste.services.address;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.address.routes.AddresDelete;
import me.upp.arquis.greenwaste.services.address.routes.AddressCreate;
import me.upp.arquis.greenwaste.services.address.routes.AddressRead;
import me.upp.arquis.greenwaste.services.address.routes.AddressUpdate;


public class Address extends Router {
    public  Address(){
        super(
                new AddressCreate(),
                new AddressRead(),
                new AddresDelete(),
                new AddressUpdate()
        );
    }
}
