package net.doss.nutzbook;

import net.doss.nutzbook.bean.User;
import net.doss.nutzbook.service.AuthorityService;
import net.doss.nutzbook.service.UserService;
import org.apache.commons.mail.HtmlEmail;
import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.integration.quartz.NutQuartzCronJobFactory;
import org.nutz.ioc.Ioc;
import org.nutz.lang.Times;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import java.util.Date;

public class MainSetup implements Setup {

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

        AuthorityService as = ioc.get(AuthorityService.class);
        as.initFormPackage("net.wendal.nutzbook");
        as.checkBasicRoles(dao.fetch(User.class, "admin"));
    }

    public void destroy(NutConfig nc) {
    }
}
