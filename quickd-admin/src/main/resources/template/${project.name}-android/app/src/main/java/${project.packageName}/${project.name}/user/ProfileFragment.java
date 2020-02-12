package ${project.group}.${project.name}.user;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.View;
import android.widget.TextView;

import com.afollestad.materialdialogs.MaterialDialog;
import com.allen.library.CircleImageView;
import com.allen.library.SuperTextView;
import com.blankj.utilcode.util.ToastUtils;
import com.bumptech.glide.Glide;
import com.chenenyu.router.Router;
import com.chenenyu.router.annotation.Route;
import ${project.group}.${project.name}.App;
import ${project.group}.${project.name}.base.AppBaseFragment;
import ${project.group}.${project.name}.R;

import java.util.HashMap;

import butterknife.BindView;
import butterknife.OnClick;


/**
 * ProfileFragment
 *
 * @author Charles
 */
@Route(value = "ProfileFragment")
public class ProfileFragment extends AppBaseFragment {

    @BindView(R.id.iv_avatar)
    CircleImageView ivAvatar;
    @BindView(R.id.tv_name)
    TextView tvName;
    @BindView(R.id.tv_exist)
    SuperTextView tvExist;
    @BindView(R.id.tv_recommend)
    SuperTextView tvRecommend;
    @BindView(R.id.srl_container)
    SwipeRefreshLayout srlContainer;

    private User user;

    @Override
    protected int getLayoutId() {
        return R.layout.activity_profile;
    }


    @Override
    protected void onSetup(View view, Bundle savedInstanceState) {
        //registerEventBus();
        srlContainer.setEnabled(false);

    }

    @Override
    public void onFirstVisible() {
        super.onFirstVisible();
        user = App.getInstance().getLoginUser();
        fillUserView();
    }

    @Override
    public void onVisible() {
        user = App.getInstance().getLoginUser();
        fillUserView();
    }

    private void fillUserView() {
        if (null == user) {
            srlContainer.setEnabled(false);
            Glide.with(this).load(R.mipmap.ic_launcher).into(ivAvatar);
            tvName.setText("注册/登录");
            tvExist.setVisibility(View.INVISIBLE);
        } else {
            srlContainer.setEnabled(true);
            //Glide.with(this).load(user.getAvatarImg()).error(R.mipmap.ic_avatar).into(ivAvatar);
            Glide.with(this).load(R.mipmap.ic_launcher).into(ivAvatar);
            tvName.setText(user.getName());
            tvExist.setVisibility(View.VISIBLE);
        }
    }

    @OnClick({R.id.tv_settings,
            R.id.tv_feedback, R.id.tv_recommend,
            R.id.tv_about, R.id.tv_exist,
            R.id.iv_avatar, R.id.tv_name,})
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.iv_avatar:
            case R.id.tv_name:
                //Router.build("ProfileEdit").requestCode(Const.RequestCode.PROFILE_EDIT).go(this);
                break;
            case R.id.tv_exist:
                attemptLogout();
                break;
            case R.id.tv_settings:
                Router.build("Settings").go(this);
                break;
            case R.id.tv_about:
                Router.build("About").go(this);
                break;
        }
    }

    /**
     * logout
     */
    protected void attemptLogout() {
        new MaterialDialog.Builder(getContext())
                .title(R.string.logout)
                .content(R.string.msg_logout_confirm)
                .positiveText(R.string.confirm)
                .onPositive((dialog, which) -> {
                    App.getInstance().clearUserLogin();
                    ToastUtils.showLong(R.string.msg_logout_success);
                    Router.build("Login").go(this);
                    finishActivity();
                })
                .negativeText(R.string.cancel)
                .show();
    }

}
