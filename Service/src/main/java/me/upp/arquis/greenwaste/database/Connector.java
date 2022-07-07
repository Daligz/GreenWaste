package me.upp.arquis.greenwaste.database;

import me.upp.daligz.p3.backend.modelo.SimpleSourceBuilder;
import net.royalmind.library.lightquery.HikariPool;

public class Connector {
    public static final HikariPool HIKARI_POOL = new HikariPool(
            new SimpleSourceBuilder()
                    .setUlr("jdbc:mysql://localhost:3306/greenwaste?useSSL=false")
                    .setUser("root")
                    .setPassword("")
                    .build()
    );
}
