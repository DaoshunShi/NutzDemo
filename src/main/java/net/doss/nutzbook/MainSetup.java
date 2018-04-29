package net.doss.nutzbook;

import net.doss.nutzbook.bean.User;
import net.doss.nutzbook.bean.UserProfile;
import net.doss.nutzbook.service.AuthorityService;
import net.doss.nutzbook.service.UserService;
import net.sf.ehcache.CacheManager;
import org.apache.commons.mail.HtmlEmail;
import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.integration.quartz.NutQuartzCronJobFactory;
import org.nutz.ioc.Ioc;
import org.nutz.lang.Times;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import java.util.Date;

public class MainSetup implements Setup {

    private static final Log log = Logs.get();

    // 特别留意一下,是init方法,不是destroy方法!!!!!
    public void init(NutConfig nc) {
        Ioc ioc = nc.getIoc();
        Dao dao = ioc.get(Dao.class);
        // 如果没有createTablesInPackage,请检查nutz版本
        Daos.createTablesInPackage(dao, "net.doss.nutzbook", false);

        //为shiro做准备
//        通过Daos.migration实现表结构自动修改
        Daos.migration(dao, User.class, true, false, false);

        // 初始化默认根用户
//        if (dao.count(User.class) == 0) {
//            User user = new User();
//            user.setName("admin");
//            user.setPassword("123456");
//            user.setCreateTime(new Date());
//            user.setUpdateTime(new Date());
//            dao.insert(user);
//        }
        //为Shiro做准备
        // 初始化默认根用户
        if (dao.count(User.class) == 0) {
            UserService us = ioc.get(UserService.class);
            us.add("admin", "123456");
        }

        // 初始化游客用户
        User guest = dao.fetch(User.class, "guest");
        if (guest == null) {
            UserService us = ioc.get(UserService.class);
            guest = us.add("guest", "123456");
            UserProfile profile = dao.fetch(UserProfile.class, guest.getId());
            profile.setNickname("游客");
            dao.update(profile, "nickname");
        }

        // 获取NutQuartzCronJobFactory从而触发计划任务的初始化与启动
        ioc.get(NutQuartzCronJobFactory.class);

        // 测试发送邮件
//        try {
//            HtmlEmail email = ioc.get(HtmlEmail.class);
//            email.setSubject("测试NutzBook");
//            email.setMsg("This is a test mail ... :-)" + System.currentTimeMillis());
//            email.addTo("995025784@qq.com");//请务必改成您自己的邮箱啊!!!
//            email.buildMimeMessage();
//            email.sendMimeMessage();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        // 权限系统初始化
        AuthorityService as = ioc.get(AuthorityService.class);
        as.initFormPackage("net.doss.nutzbook");
        as.checkBasicRoles(dao.fetch(User.class, "admin"));

        CacheManager cacheManager = ioc.get(CacheManager.class);
        log.debug("Ehcache CacheManager = " + cacheManager);
    }

    public void destroy(NutConfig nc) {
    }
}
