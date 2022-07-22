package me.upp.arquis.greenwaste.services.claims;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.claims.routes.ClaimCreate;

public class Claims extends Router {

    public Claims() {
        super(
                new ClaimCreate()
        );
    }
}
