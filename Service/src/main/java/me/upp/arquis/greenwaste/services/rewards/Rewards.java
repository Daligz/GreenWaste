package me.upp.arquis.greenwaste.services.rewards;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.rewards.routes.RewardCreate;
import me.upp.arquis.greenwaste.services.rewards.routes.RewardDelete;
import me.upp.arquis.greenwaste.services.rewards.routes.RewardRead;
import me.upp.arquis.greenwaste.services.rewards.routes.RewardUpdate;

public class Rewards extends Router {

    public Rewards() {
        super(
                new RewardCreate(),
                new RewardRead(),
                new RewardUpdate(),
                new RewardDelete()
        );
    }
}
