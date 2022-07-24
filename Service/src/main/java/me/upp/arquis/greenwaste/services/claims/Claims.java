package me.upp.arquis.greenwaste.services.claims;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.claims.routes.ClaimCreate;
import me.upp.arquis.greenwaste.services.claims.routes.ClaimRead;

public class Claims extends Router {

    public Claims() {
        super(
                new ClaimCreate(),
                new ClaimRead()
        );
    }
}
