package ${project.group}.${project.name}.user;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.View;

import com.chenenyu.router.Router;
import com.chenenyu.router.annotation.Route;
import com.idogfooding.backbone.ui.BaseActivity;

/**
 * ProfileActivity
 *
 * @author Charles
 */
@Route(value = "Profile", interceptors = "Login")
public class ProfileActivity extends BaseActivity {


    @Override
    protected void onSetup(Bundle savedInstanceState) {
        this.showToolbar = false;
        super.onSetup(savedInstanceState);
        replaceFragment((Fragment) Router.build("ProfileFragment").getFragment(this));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

    }


}
