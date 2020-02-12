package ${project.group}.${project.name}.network;

import ${project.group}.${project.name}.App;

public class Api {

    public static final String SERVER_API = "http://quickd.jhyj56.com/quickd/";

    public static final String USER_LOGIN = getApi() + "sys/login";

    public static final String TOKEN_KEY = "token";

    public static String getApi() {
        return App.getInstance().getApi();
    }
    //error code
    public static  final  int RESPONSE_EXPIRED=500;
}
