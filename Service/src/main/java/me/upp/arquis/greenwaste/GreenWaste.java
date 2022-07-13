package me.upp.arquis.greenwaste;

import com.google.gson.Gson;
import me.upp.arquis.greenwaste.services.Service;
import me.upp.arquis.greenwaste.services.ServicesStorage;
import me.upp.arquis.greenwaste.services.rewards.Rewards;
import me.upp.arquis.greenwaste.services.users.Users;
import me.upp.arquis.greenwaste.storages.Storage;
import spark.Spark;

public class GreenWaste {

    public static Gson GSON = new Gson();

    public static void main(final String[] args) {
        // Set port to service
        Spark.port(6969);
        final Storage<Service> services = new ServicesStorage(
                // Add here all services
                new Rewards(),
                new Users()
        );
    }
}
