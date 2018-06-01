package net.doss.nutzbook.module;

import net.doss.nutzbook.bean.User;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.*;
import org.nutz.mvc.filter.CheckSession;

import java.util.ArrayList;
import java.util.List;

@IocBean
@At("/sidebar")
@Filters(@By(type=CheckSession.class, args={"me", "/"})) // 检查当前Session是否带me这个属性
public class SidebarModule extends BaseModule {

    private static final Log log = Logs.get();

    @At
    @Filters
    @Ok("jsp:jsp.aceAdmin.main")
    public void aceAdminMain() {

    }

    @At
    public Object query(@Param("..")User user) {
//        Cnd cnd = Strings.isBlank(name)? null : Cnd.where("name", "like", "%"+name+"%");
//        QueryResult qr = new QueryResult();
//        qr.setList(dao.query(User.class, cnd, pager));
//        pager.setRecordCount(dao.count(User.class, cnd));
//        qr.setPager(pager);

        QueryResult qr = new QueryResult();
        String json = "[{\"id\":\"1100\",\"code\":\"1100\",\"resourceName\":\"系统管理\",\"displayOrder\":\"\",\"parentMenuId\":\"1\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1110\",\"code\":\"1110\",\"resourceName\":\"用户管理\",\"displayOrder\":\"\",\"parentMenuId\":\"11\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1111\",\"code\":\"1111\",\"resourceName\":\"部门管理\",\"displayOrder\":\"console/organ/orgIndex.jsp\",\"parentMenuId\":\"111\",\"linkPath\":\"console/organ/orgIndex.jsp\",\"cls\":\"\"},{\"id\":\"1112\",\"code\":\"1112\",\"resourceName\":\"账号管理\",\"displayOrder\":\"console/user/userIndex.jsp\",\"parentMenuId\":\"111\",\"linkPath\":\"console/user/userIndex.jsp\",\"cls\":\"\"},{\"id\":\"1113\",\"code\":\"1113\",\"resourceName\":\"角色管理\",\"displayOrder\":\"console/group/groupList.jsp\",\"parentMenuId\":\"111\",\"linkPath\":\"console/group/groupList.jsp\",\"cls\":\"\"},{\"id\":\"1120\",\"code\":\"1120\",\"resourceName\":\"权限管理\",\"displayOrder\":\"\",\"parentMenuId\":\"11\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1121\",\"code\":\"1121\",\"resourceName\":\"菜单管理\",\"displayOrder\":\"console/menu/menuIndex.jsp\",\"parentMenuId\":\"112\",\"linkPath\":\"console/menu/menuIndex.jsp\",\"cls\":\"\"},{\"id\":\"1122\",\"code\":\"1122\",\"resourceName\":\"权限管理\",\"displayOrder\":\"console/authorization/privilegeIndex.jsp\",\"parentMenuId\":\"112\",\"linkPath\":\"console/authorization/privilegeIndex.jsp\",\"cls\":\"\"},{\"id\":\"1130\",\"code\":\"1130\",\"resourceName\":\"基础配置\",\"displayOrder\":\"\",\"parentMenuId\":\"11\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1131\",\"code\":\"1131\",\"resourceName\":\"字典管理\",\"displayOrder\":\"console/dict/dictList.jsp\",\"parentMenuId\":\"113\",\"linkPath\":\"console/dict/dictList.jsp\",\"cls\":\"\"},{\"id\":\"1132\",\"code\":\"1132\",\"resourceName\":\"系统参数配置\",\"displayOrder\":\"console/param/paramIndex.jsp\",\"parentMenuId\":\"113\",\"linkPath\":\"console/param/paramIndex.jsp\",\"cls\":\"\"}]";

        return qr; //默认分页是第1页,每页20条
    }

    @At
    public Object queryJson(@Param("name")String name, @Param("..")Pager pager) {
        String str = "[{\"id\":\"1100\",\"code\":\"1100\",\"resourceName\":\"系统管理\",\"displayOrder\":\"\",\"parentMenuId\":\"1\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1110\",\"code\":\"1110\",\"resourceName\":\"用户管理\",\"displayOrder\":\"\",\"parentMenuId\":\"11\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1111\",\"code\":\"1111\",\"resourceName\":\"部门管理\",\"displayOrder\":\"console/organ/orgIndex.jsp\",\"parentMenuId\":\"111\",\"linkPath\":\"console/organ/orgIndex.jsp\",\"cls\":\"\"},{\"id\":\"1112\",\"code\":\"1112\",\"resourceName\":\"账号管理\",\"displayOrder\":\"console/user/userIndex.jsp\",\"parentMenuId\":\"111\",\"linkPath\":\"console/user/userIndex.jsp\",\"cls\":\"\"},{\"id\":\"1113\",\"code\":\"1113\",\"resourceName\":\"角色管理\",\"displayOrder\":\"console/group/groupList.jsp\",\"parentMenuId\":\"111\",\"linkPath\":\"console/group/groupList.jsp\",\"cls\":\"\"},{\"id\":\"1120\",\"code\":\"1120\",\"resourceName\":\"权限管理\",\"displayOrder\":\"\",\"parentMenuId\":\"11\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1121\",\"code\":\"1121\",\"resourceName\":\"菜单管理\",\"displayOrder\":\"console/menu/menuIndex.jsp\",\"parentMenuId\":\"112\",\"linkPath\":\"console/menu/menuIndex.jsp\",\"cls\":\"\"},{\"id\":\"1122\",\"code\":\"1122\",\"resourceName\":\"权限管理\",\"displayOrder\":\"console/authorization/privilegeIndex.jsp\",\"parentMenuId\":\"112\",\"linkPath\":\"console/authorization/privilegeIndex.jsp\",\"cls\":\"\"},{\"id\":\"1130\",\"code\":\"1130\",\"resourceName\":\"基础配置\",\"displayOrder\":\"\",\"parentMenuId\":\"11\",\"linkPath\":\"\",\"cls\":\"\"},{\"id\":\"1131\",\"code\":\"1131\",\"resourceName\":\"字典管理\",\"displayOrder\":\"console/dict/dictList.jsp\",\"parentMenuId\":\"113\",\"linkPath\":\"console/dict/dictList.jsp\",\"cls\":\"\"},{\"id\":\"1132\",\"code\":\"1132\",\"resourceName\":\"系统参数配置\",\"displayOrder\":\"console/param/paramIndex.jsp\",\"parentMenuId\":\"113\",\"linkPath\":\"console/param/paramIndex.jsp\",\"cls\":\"\"}]";
        QueryResult qr = new QueryResult();
        List<Menu> list = new ArrayList<>();

        Menu menu = new Menu("1100","1100","系统管理","","1","","");
        list.add(menu);
        menu = new Menu("1110","1110","用户管理","","11","","");
        list.add(menu);

        qr.setList(list);

//        JSONObject jsonObj = null;
//        try {
//            jsonObj = (JSONObject) (new JSONParser().parse(str));
//
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
        return qr;

//        Cnd cnd = Strings.isBlank(name)? null : Cnd.where("name", "like", "%"+name+"%");
//        QueryResult qr = new QueryResult();
//        qr.setList(dao.query(User.class, cnd, pager));
//        String str = dao.query(User.class, cnd, pager).toString();
//        pager.setRecordCount(dao.count(User.class, cnd));
//        qr.setPager(pager);
//        return qr; //默认分页是第1页,每页20条
    }


}

class Menu {
    private String id;
    private String code;
    private String resourceName;
    private String displayOrder;
    private String parentMenuId;
    private String linkPath;
    private String cls;

    public Menu(String id, String code, String resourceName, String displayOrder, String parentMenuId, String linkPath, String cls) {
        this.id = id;
        this.code = code;
        this.resourceName = resourceName;
        this.displayOrder = displayOrder;
        this.parentMenuId = parentMenuId;
        this.linkPath = linkPath;
        this.cls = cls;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(String displayOrder) {
        this.displayOrder = displayOrder;
    }

    public String getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(String parentMenuId) {
        this.parentMenuId = parentMenuId;
    }

    public String getLinkPath() {
        return linkPath;
    }

    public void setLinkPath(String linkPath) {
        this.linkPath = linkPath;
    }

    public String getCls() {
        return cls;
    }

    public void setCls(String cls) {
        this.cls = cls;
    }

}
