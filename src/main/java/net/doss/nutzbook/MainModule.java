package net.doss.nutzbook;

import org.nutz.integration.shiro.ShiroSessionProvider;
import org.nutz.mvc.annotation.*;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

@SetupBy(value=MainSetup.class)
//@IocBy(type=ComboIocProvider.class, args={"*js", "ioc/",
//        // 这个package下所有带@IocBean注解的类,都会登记上
//        "*anno", "net.doss.nutzbook",
//        "*tx", // 事务拦截 aop
//        "*async"}) // 异步执行aop
@IocBy(type=ComboIocProvider.class, args={
        "*js", "ioc/",
        "*anno", "net.doss.nutzbook",
        "*tx",
        "*jedis",
        "*quartz"})
@Modules(scanPackage=true)
@Localization(value="msg/", defaultLocalizationKey="zh-CN")
@ChainBy(args="mvc/nutzbook-mvc-chain.js")
@SessionBy(ShiroSessionProvider.class)
public class MainModule {
}
