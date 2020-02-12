package ${project.group}.${project.name};

/**
 * Const
 *
 * @author Charles
 */
public interface Const {

    interface RequestCode {

        int PHOTOS1_PICK = 0x1000; //
        int PHOTOS1_PREVIEW = 0x1001; //
        int PHOTOS2_PICK = 0x1002; //
        int PHOTOS2_PREVIEW = 0x1003; //
        int PHOTOS3_PICK = 0x1004; //
        int PHOTOS3_PREVIEW = 0x1005; //
        int PHOTOS4_PICK = 0x1006; //
        int PHOTOS4_PREVIEW = 0x1007; //

        int LOGIN = 0x0001; // 登录
        int PROFILE_EDIT = 0x0002; // 用户信息编辑
        int LOCATION_CHOOSE = 0x0003; // 位置选择


    }

    interface Cfg {
        String APP_TAG = "zhzt";
        String BUGLY_APPID = "4ff382fe21";
        String MI_APPID = "2882303761517616989";
        String MI_APPKEY = "5801761649989";
         String URL_API = "https://zhatu.dacyun.com/zhatu/";
//        String URL_API = " http://quickd.ngrok.dacanginfo.com/zhatu/";
        String URL_H5 = "http://h5/";
        String URL_IMG = "http:///";
        float DEFAULT_ZOOM = 15f;
        String URL_H5_INFORMATION_VIEW = URL_H5 + "information/view?id=";
    }

    interface ListType {
        String LIST = "LIST"; // 列表
        String MULTICHOOSE = "MULTICHOOSE"; // 多选列表
        String SINGLECHOOSE = "SINGLECHOOSE"; // 单选列表
    }

    interface ViewType {
        String ADD = "ADD";
        String EDIT = "EDIT";
        String VIEW = "VIEW";
        String AUDIT = "AUDIT";
    }

}
