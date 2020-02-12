package ${project.group}.${project.name}.base;


import com.afollestad.materialdialogs.MaterialDialog;
import com.blankj.utilcode.util.ToastUtils;
import com.chenenyu.router.Router;
import com.idogfooding.backbone.network.ApiException;
import com.idogfooding.backbone.ui.BaseFragment;
import ${project.group}.${project.name}.App;
import com.tencent.bugly.crashreport.CrashReport;
import ${project.group}.${project.name}.R;

/**
 * AppBaseFragment
 *
 * @author Charles
 */
public abstract class AppBaseFragment extends BaseFragment {

    protected void handleApiError(Throwable throwable) {
        if (throwable instanceof ApiException) {
            ApiException apiException = (ApiException) throwable;
            if (apiException.isUnauthorized()) {
                App.getInstance().clearUserLogin();
                new MaterialDialog.Builder(getContext())
                        .title("登录信息超时")
                        .content("您的登录信息已过期,或已在其他设备登录,是否重新登录?")
                        .positiveText(R.string.yes)
                        .onPositive((dialog, which) -> Router.build("Login").go(this))
                        .negativeText(R.string.no)
                        .show();
            } else {
                ToastUtils.showLong(apiException.getCode() + ":" + apiException.getMessage());
            }
        } else {
            CrashReport.postCatchedException(throwable);
            ToastUtils.showLong("内部错误," + throwable.getMessage());
        }
    }


}
