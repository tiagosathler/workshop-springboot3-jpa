package jakarta.persistence;

public enum SharedCacheMode  {
	/**
     * All entities and entity-related state and data are cached.
     */
    ALL, 

    /**
     * Caching is disabled for the persistence unit.
     */
    NONE, 

    /**
     * Caching is enabled for all entities for <code>Cacheable(true)</code>
     * is specified.  All other entities are not cached.
     */
    ENABLE_SELECTIVE, 

    /**
     * Caching is enabled for all entities except those for which
     * <code>Cacheable(false)</code> is specified.  Entities for which
     * <code>Cacheable(false)</code> is specified are not cached.
     */
    DISABLE_SELECTIVE, 

    /**
     * 
     * Caching behavior is undefined: provider-specific defaults may apply.
     */
    UNSPECIFIED
}
