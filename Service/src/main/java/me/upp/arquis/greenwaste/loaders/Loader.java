package me.upp.arquis.greenwaste.loaders;

import java.util.*;

public abstract class Loader<T> {

    private final Set<T> set = new HashSet<>();

    @SafeVarargs
    public final void add(final T... t) {
        this.set.addAll(Arrays.asList(t));
    }

    @SafeVarargs
    public final void remove(final T... t) {
        Arrays.asList(t).forEach(this.set::remove);
    }

    public List<T> get() {
        return new ArrayList<>(this.set);
    }
}
