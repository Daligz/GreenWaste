package me.upp.arquis.greenwaste.services.users;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.users.routes.*;

public class Users extends Router {

    public Users() {
        super(
                new UserCreate(),
                new UserDelete(),
                new UserRead(),
                new UserSpecificRead(),
                new UserLogin()

        );
    }
}
