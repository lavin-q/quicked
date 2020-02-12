package ${project.group}.${project.name}.common;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;

import com.chenenyu.router.Router;
import com.idogfooding.backbone.ui.tab.TabEntity;
import com.idogfooding.backbone.ui.tab.TabFragmentPagerAdapter;
import ${project.group}.${project.name}.R;

/**
 * HomePagerAdapter
 *
 * @author Charles Zhang
 */
public class HomePagerAdapter extends TabFragmentPagerAdapter {


    public HomePagerAdapter(FragmentActivity activity) {
        super(activity);
    }

    @Override
    protected void initTabEntities() {
        super.initTabEntities();
        mTabEntities.add(new TabEntity(activity.getString(R.string.index), R.mipmap.car_active, R.mipmap.car));
        mTabEntities.add(new TabEntity(activity.getString(R.string.profile), R.mipmap.ic_profile_selected, R.mipmap.ic_profile));
    }

    @Override
    protected void initFragments() {
        super.initFragments();
        mFragments.add((Fragment) Router.build("WorkbenchFragment").getFragment(activity));
        mFragments.add((Fragment) Router.build("ProfileFragment").getFragment(activity));
    }

}