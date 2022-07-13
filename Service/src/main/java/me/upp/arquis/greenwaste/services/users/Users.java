package me.upp.arquis.greenwaste.services.users;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.users.routes.UserCreate;
import me.upp.arquis.greenwaste.services.users.routes.UserDelete;
import me.upp.arquis.greenwaste.services.users.routes.UserRead;

public class Users extends Router {

    public Users() {
        super(
                new UserCreate(),
                new UserDelete(),
                new UserRead()
        );
    }
}
