package me.upp.arquis.greenwaste.services.users;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.users.routes.UserCreate;

public class Users extends Router {

    public Users() {
        super(
                new UserCreate()
        );
    }
}
