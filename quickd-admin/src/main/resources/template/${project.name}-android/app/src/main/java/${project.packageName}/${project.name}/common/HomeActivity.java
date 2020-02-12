package ${project.group}.${project.name}.common;

import android.os.Bundle;
import android.support.v4.app.Fragment;

import com.blankj.utilcode.util.NetworkUtils;
import com.blankj.utilcode.util.ToastUtils;
import com.chenenyu.router.Router;
import com.chenenyu.router.annotation.Route;
import com.idogfooding.backbone.ui.BaseActivity;
import com.idogfooding.backbone.ui.tab.TabFragmentPagerAdapter;
import com.idogfooding.backbone.ui.tab.TabPagerActivity;
import ${project.group}.${project.name}.R;
/**
 * Home
 *
 * @author elvis
 */
@Route(value = {"Home"}, interceptors = {"Login"})
public class HomeActivity extends TabPagerActivity {


    @Override
    protected TabFragmentPagerAdapter createAdapter() {
        return new HomePagerAdapter(this);
    }

    @Override
    protected void onSetup(Bundle savedInstanceState) {
        super.onSetup(savedInstanceState);

        if (NetworkUtils.isConnected()) {
        } else {
            ToastUtils.showShort(R.string.msg_network_unavailable);
        }
    }

    @Override
    protected void onConfig(Bundle savedInstanceState) {
        return;
    }

    protected int getLayoutId() {
        return R.layout.activity_main;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }


}
