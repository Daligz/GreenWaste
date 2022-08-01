package me.upp.arquis.greenwaste.services.points;

import me.upp.arquis.greenwaste.services.Router;
import me.upp.arquis.greenwaste.services.points.routes.PointCreate;
import me.upp.arquis.greenwaste.services.points.routes.PointRead;
import me.upp.arquis.greenwaste.services.points.routes.PointUpdate;

public class Points extends Router {

    public Points() {
        super(
                new PointRead(),
                new PointCreate(),
                new PointUpdate()
        );
    }
}
