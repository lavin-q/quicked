package ${project.group}.${project.name}.common;

import android.Manifest;
import android.content.Intent;
import android.os.Bundle;
import android.text.format.DateUtils;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.blankj.utilcode.util.BarUtils;
import com.chenenyu.router.Router;
import com.chenenyu.router.annotation.Route;
import com.idogfooding.backbone.RequestCode;
import com.idogfooding.backbone.ui.BaseActivity;
import com.idogfooding.backbone.widget.CountDownTimerWithPause;
import ${project.group}.${project.name}.R;
import ${project.group}.${project.name}.base.AppBaseActivity;

import butterknife.BindView;
import butterknife.OnClick;

/**
 * Splash
 *
 * @author Charles
 */
@Route(value = {"Splash"})
public class SplashActivity extends AppBaseActivity {



    @BindView(R.id.iv_splash)
    ImageView ivSplash;
    @BindView(R.id.tv_skip)
    TextView tvSkip;

    @Override
    protected int getLayoutId() {
        return R.layout.splash;
    }

    // countDownTimer
    CountDownTimerWithPause countDownTimer;

    @Override
    protected void onSetup(Bundle savedInstanceState) {
        super.onSetup(savedInstanceState);
        Router.injectParams(this);
        initSplash();
    }

    private void initSplash() {
        askForPermissions(
                Manifest.permission.CAMERA,
                Manifest.permission.INTERNET);
    }

    @Override
    protected void afterPermissionGranted() {
        tvSkip.setVisibility(View.GONE);
        // init counter down timer
        countDownTimer = new CountDownTimerWithPause(DateUtils.SECOND_IN_MILLIS, DateUtils.SECOND_IN_MILLIS) {
            @Override
            public void onTick(long millisUntilFinished) {
                if (!isFinishing()) {
                    tvSkip.setText(getString(R.string.skip_wait, (millisUntilFinished / 1000)));
                }
            }

            @Override
            public void onFinish() {
                tvSkip.setText("正在跳转");
                checkAccountLogin();
            }
        };
        countDownTimer.start();
    }

    @OnClick({R.id.tv_skip})
    public void onClick(View view) {
        // requestForPermission();
        if (countDownTimer != null) {
            countDownTimer.cancel();
        }
        checkAccountLogin();
    }

    private void checkAccountLogin() {
        Router.build("Home").go(this);
        finish();
    }

    @Override
    public void onDestroy() {
        if (null != countDownTimer) {
            countDownTimer.cancel();
        }
        super.onDestroy();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == RequestCode.PERMISSION_MULTI) {
            askForPermissions(Manifest.permission.READ_PHONE_STATE,
                    Manifest.permission.ACCESS_FINE_LOCATION,
                    Manifest.permission.CAMERA,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE,
                    Manifest.permission.READ_EXTERNAL_STORAGE);
        } else {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

}