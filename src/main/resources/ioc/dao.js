var ioc = {
    conf : {
        type : "org.nutz.ioc.impl.PropertiesProxy",
        fields : {
            paths : ["custom/"]
        }
    },
    dataSource : {
        factory : "$conf#make",
        args : ["com.alibaba.druid.pool.DruidDataSource", "db."],
        type : "com.alibaba.druid.pool.DruidDataSource",
        events : {
            create : "init",
            depose : 'close'
        }
    },
    dao : {
        type : "org.nutz.dao.impl.NutDao",
        args : [{refer:"dataSource"}],
        fields : {
            interceptors : [{refer:"cacheExecutor"}, "log"]
        }
    },
    cacheExecutor : {
        type : "org.nutz.plugins.cache.dao.DaoCacheInterceptor",
        fields : {
            cacheProvider : {refer:"cacheProvider"},
            // 需要缓存的表名
            cachedTableNames : ["t_user_profile",
                //"t_user", "t_role", "t_permission", "t_role_permission"
            ]
        }
    },
    // 基于Ehcache的DaoCacheProvider
    cacheProvider : {
        type : "org.nutz.plugins.cache.dao.impl.provider.EhcacheDaoCacheProvider",
        fields : {
            cacheManager : {refer:"cacheManager"} // 引用ehcache.js中定义的CacheManager
        },
        events : {
            create : "init"
        }
    }
};