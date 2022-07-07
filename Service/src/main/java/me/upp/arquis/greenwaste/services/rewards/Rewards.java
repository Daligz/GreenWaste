package me.upp.arquis.greenwaste.services.rewards;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.rewards.routes.RewardCreate;
import me.upp.arquis.greenwaste.services.rewards.routes.RewardDelete;

public class Rewards extends Router {

    public Rewards() {
        super(
                new RewardCreate(),
                new RewardDelete()
        );
    }
}
