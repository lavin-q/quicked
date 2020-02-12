package ${project.group}.${project.name}.user;

import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;

import com.blankj.utilcode.util.StringUtils;
import com.chenenyu.router.Router;
import com.chenenyu.router.annotation.InjectParam;
import com.chenenyu.router.annotation.Route;
import com.idogfooding.backbone.network.ApiException;
import ${project.group}.${project.name}.App;
import ${project.group}.${project.name}.R;
import ${project.group}.${project.name}.network.Api;
import com.idogfooding.backbone.ui.BaseActivity;
import ${project.group}.${project.name}.network.ApiCallback;
import ${project.group}.${project.name}.network.ApiHttpResult;
import com.kongzue.dialog.v2.TipDialog;
import com.kongzue.dialog.v2.WaitDialog;
import com.lzy.okgo.OkGo;
import com.lzy.okgo.model.HttpParams;
import com.lzy.okgo.model.Response;

import butterknife.BindView;
import org.json.JSONException;
import okhttp3.RequestBody;

/**
 * 登录
 *
 * @author elvis
 */
@Route({"Login"})
public class LoginActivity extends BaseActivity {

    @BindView(R.id.et_username)
    EditText etUsername;
    @BindView(R.id.et_pwd)
    EditText etPwd;

    @InjectParam
    String username;
    @InjectParam
    String pwd;

    @Override
    protected int getLayoutId() {
        return R.layout.login;
    }

    @Override
    protected void onSetup(Bundle savedInstanceState) {
        super.onSetup(savedInstanceState);

        initViews();
    }


    private void initViews() {
        // init editor action
        etUsername.setOnEditorActionListener((textView, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_NEXT) {
                etPwd.requestFocus();
            }
            return true;
        });

        etPwd.setOnEditorActionListener((textView, actionId, keyEvent) -> {
            if (actionId == EditorInfo.IME_ACTION_DONE) {
                attemptLogin(textView);
                return true;
            }
            return false;
        });
        if (username != null) {
            etUsername.setText(username);
        }
        if (pwd != null) {
            etPwd.setText(pwd);
        }
    }



    /**
     * 登录
     *
     * @param v
     */
    public void attemptLogin(View v) {
        String username = etUsername.getText().toString().trim();
        String pwd = etPwd.getText().toString().trim();

//        if (!RegexUtils.isMobileExact(username)) {
//            etUsername.requestFocus();
//            showTipDialog(getString(R.string.msg_phone_format_error));
//            return;
//        }

        if (StringUtils.isEmpty(pwd)) {
            etPwd.requestFocus();
            showTipDialog("密码不能为空");
            return;
        }
        realLogin(username, pwd);

    }

    public void realLogin(String username, String pwd) {
        org.json.JSONObject jsonObject = new org.json.JSONObject();
        try {
            jsonObject.put("username", Base64Util.encode(username));
            jsonObject.put("password",  Base64Util.encode(pwd));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        RequestBody requestBody = RequestBody.create(Api.JSON,jsonObject.toString());
        OkGo.<ApiHttpResult<LoginResult>>post(Api.USER_LOGIN)
                .tag(this)
                .upRequestBody(requestBody)
                .execute(new ApiCallback<ApiHttpResult<LoginResult>>(this, true) {

                    @Override
                    public void onSuccessData(Response<ApiHttpResult<LoginResult>> response, ApiHttpResult<LoginResult> data) {
                        if (data.getCode() == 0) {
                            saveLoginResult(data.getData());
                        }else{
                            showMessageDialog(response.getException().getMessage());
                        }
                    }

                    @Override
                    protected void onApiError
                            (Response<ApiHttpResult<LoginResult>> response,
                             ApiException exception) {
                        showMessageDialog(response.getException().getMessage());
                    }

                    @Override
                    public void onFinish() {
                        super.onFinish();
                        WaitDialog.dismiss();

                    }
                });


    }

    /**
     * 登录成功，处理登录结果
     */
    private void saveLoginResult(final LoginResult result) {
        boolean saveUserLogin = App.getInstance().saveUserLogin(result);
        if (saveUserLogin) {
            showTipDialog(getString(R.string.msg_login_success), TipDialog.TYPE_FINISH);
            Router.build("Home").go(this);
            finish();
        }
    }


}
