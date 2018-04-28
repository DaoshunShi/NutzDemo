package net.doss.nutzbook.module;

import net.doss.nutzbook.bean.User;
import net.doss.nutzbook.bean.UserProfile;
import net.doss.nutzbook.service.UserService;
import net.doss.nutzbook.util.Toolkit;
import org.nutz.aop.interceptor.ioc.TransAop;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.aop.Aop;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.Scope;
import org.nutz.mvc.annotation.*;
import org.nutz.mvc.filter.CheckSession;

import javax.servlet.http.HttpSession;
import java.util.Date;

@IocBean // 还记得@IocBy吗? 这个跟@IocBy有很大的关系哦
@At("/user")
//@Ok("json")
@Ok("json:{locked:'password|salt',ignoreNull:true}")    //   密码和salt也不可以发送到浏览器去.
@Fail("http:500")
@Filters(@By(type=CheckSession.class, args={"me", "/"}))
public class UserModule extends BaseModule {

//    继承BaseModule,并删除dao属性(非常非常重要).
//    子类与超类的同名属性,会被屏蔽, 导致父类的同名属性没有赋值,调用时出现NPE
//    @Inject
//    protected Dao dao; // 就这么注入了,有@IocBean它才会生效

    @At
    public int count() {    // 统计用户数的方法,算是个测试点
        return dao.count(User.class);
    }

//    为shiro做准备
    @Inject protected UserService userService;

//    原版登陆
//    @At
//    @Filters()  // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
//    public Object login(@Param("username")String name, @Param("password")String password, HttpSession session) {
//        User user = dao.fetch(User.class, Cnd.where("name", "=", name).and("password", "=", password));
//        if (user == null) {
//            return false;
//        } else {
//            session.setAttribute("me", user.getId());
//            return true;
//        }
//    }
//    带验证码的登陆
//    @At
//    @Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
//    public Object login(@Param("username")String name,
//                        @Param("password")String password,
//                        @Param("captcha")String captcha,
//                        @Attr(scope=Scope.SESSION, value="nutz_captcha")String _captcha,
//                        HttpSession session) {
//        NutMap re = new NutMap();
//        if (!Toolkit.checkCaptcha(_captcha, captcha)) {
//            return re.setv("ok", false).setv("msg", "验证码错误");
//        }
//        User user = dao.fetch(User.class, Cnd.where("name", "=", name).and("password", "=", password));
//        if (user == null) {
//            return re.setv("ok", false).setv("msg", "用户名或密码错误");
//        } else {
//            session.setAttribute("me", user.getId());
//            return re.setv("ok", true);
//        }
//    }
//    为shiro做准备 登陆
    @At
    @Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    @POST
    public Object login(@Param("username")String username,
                        @Param("password")String password,
                        @Param("captcha")String captcha,
                        @Attr(scope=Scope.SESSION, value="nutz_captcha")String _captcha,
                        HttpSession session) {
        NutMap re = new NutMap();
        if (!Toolkit.checkCaptcha(_captcha, captcha)) {
            return re.setv("ok", false).setv("msg", "验证码错误");
        }
        int userId = userService.fetch(username, password);
        if (userId < 0) {
            return re.setv("ok", false).setv("msg", "用户名或密码错误");
        } else {
            session.setAttribute("me", userId);
            // 完成nutdao_realm后启用.
            // SecurityUtils.getSubject().login(new SimpleShiroToken(userId));
            return re.setv("ok", true);
        }
    }

    //shiro
    @GET
    @At("/login")
    @Filters
    @Ok("jsp:jsp.user.login") // 降内部重定向到登录jsp
    public void loginPage() {}

    @At
    @Ok(">>:/") // 跟其他方法不同,这个方法完成后就跳转首页了
    public void logout(HttpSession session) {
        session.invalidate();
    }

//    @GET
    @At("/")
    @Ok("jsp:jsp.user.list") // 真实路径是 /WEB-INF/jsp/user/list.jsp
    public void index() {
    }

    @At
    @Ok("jsp:jsp.user.success")
    public void loginSuccess() {

    }

    @At
    @Ok("jsp:jsp.user.userUpdate")
    public void userUpdate() {

    }


//    原版
//    @At
//    public Object add(@Param("..")User user) {  // 两个点号是按对象属性一一设置
//        NutMap re = new NutMap();
//        String msg = checkUser(user, true);
//        if (msg != null){
//            return re.setv("ok", false).setv("msg", msg);
//        }
//        user.setCreateTime(new Date());
//        user.setUpdateTime(new Date());
//        user = dao.insert(user);
//        return re.setv("ok", true).setv("data", user);
//    }

//    为shiro做准备
    @At
    public Object add(@Param("..")User user) { // 两个点号是按对象属性一一设置
        NutMap re = new NutMap();
        String msg = checkUser(user, true);
        if (msg != null){
            return re.setv("ok", false).setv("msg", msg);
        }
        user = userService.add(user.getName(), user.getPassword());
        return re.setv("ok", true).setv("data", user);
    }

    //原版
//    @At
//    public Object update(@Param("..")User user) {
//        NutMap re = new NutMap();
//        String msg = checkUser(user, false);
//        if (msg != null){
//            return re.setv("ok", false).setv("msg", msg);
//        }
////        user.setName(null);// 不允许更新用户名
//        user.setCreateTime(null);//也不允许更新创建时间
//        user.setUpdateTime(new Date());// 设置正确的更新时间
//        dao.updateIgnoreNull(user);// 真正更新的其实只有password和salt
//        return re.setv("ok", true);
//    }

//    为shiro做准备
    @At
    public Object update(@Param("password")String password, @Attr("me")int me) {
        if (Strings.isBlank(password) || password.length() < 6)
            return new NutMap().setv("ok", false).setv("msg", "密码不符合要求");
        userService.updatePassword(me, password);
        return new NutMap().setv("ok", true);
    }

//    原版删除
//    @At
//    public Object delete(@Param("id")int id, @Attr("me")int me) {
//        if (me == id) {
//            return new NutMap().setv("ok", false).setv("msg", "不能删除当前用户!!");
//        }
//        dao.delete(User.class, id); // 再严谨一些的话,需要判断是否为>0
//        return new NutMap().setv("ok", true);
//    }

    //删除User的时候也删除UserProfile.
    @At
    @Aop(TransAop.READ_COMMITTED)
    public Object delete(@Param("id")int id, @Attr("me")int me) {
        if (me == id) {
            return new NutMap().setv("ok", false).setv("msg", "不能删除当前用户!!");
        }
        dao.delete(User.class, id); // 再严谨一些的话,需要判断是否为>0
        dao.clear(UserProfile.class, Cnd.where("userId", "=", me));
        return new NutMap().setv("ok", true);
    }

    @At
    public Object query(@Param("name")String name, @Param("..")Pager pager) {
        Cnd cnd = Strings.isBlank(name)? null : Cnd.where("name", "like", "%"+name+"%");
        QueryResult qr = new QueryResult();
        qr.setList(dao.query(User.class, cnd, pager));
        pager.setRecordCount(dao.count(User.class, cnd));
        qr.setPager(pager);
        return qr; //默认分页是第1页,每页20条
    }

    @At
    public Object queryNew(@Param("..")User user) {
//        Cnd cnd = Strings.isBlank(user.getName())? null : Cnd.where("name", "like", "%"+user.name+"%");
//        QueryResult qr = new QueryResult();
//        qr.setList(dao.query(User.class, cnd, pager));
//        pager.setRecordCount(dao.count(User.class, cnd));
//        qr.setPager(pager);
        Cnd idCnd = Strings.isBlank(user.getId() + "") ? null : Cnd.where("id", "=", user.getId());
        QueryResult qr = new QueryResult();
        qr.setList((dao.query(User.class, idCnd)));
        return qr;
    }

    /**
     * 校验方法
     * @param user
     * @param create
     * @return
     */
    protected String checkUser(User user, boolean create) {
        if (user == null) {
            return "空对象";
        }
        if (create) {
            if (Strings.isBlank(user.getName()) || Strings.isBlank(user.getPassword()))
                return "用户名/密码不能为空";
        } else {
            if (Strings.isBlank(user.getPassword()))
                return "密码不能为空";
        }
        String passwd = user.getPassword().trim();
        if (6 > passwd.length() || passwd.length() > 12) {
            return "密码长度错误";
        }
        user.setPassword(passwd);
        if (create) {
            int count = dao.count(User.class, Cnd.where("name", "=", user.getName()));
            if (count != 0) {
                return "用户名已经存在";
            }
        } else {
            if (user.getId() < 1) {
                return "用户Id非法";
            }
        }
        if (user.getName() != null)
            user.setName(user.getName().trim());
        return null;
    }
}