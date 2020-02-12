package ${project.group}.${project.name}.workbench;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import com.blankj.utilcode.util.ToastUtils;
import com.chenenyu.router.Router;
import com.chenenyu.router.annotation.Route;

import com.idogfooding.backbone.network.PageResult;
import com.idogfooding.backbone.ui.rv.RVFragment;
import com.idogfooding.backbone.ui.rv.SpaceDecoration;
import ${project.group}.${project.name}.R;

import java.util.ArrayList;
import java.util.List;


/**
 * WorkbenchFragment
 */
@Route(value = "WorkbenchFragment")
public class WorkbenchFragment extends RVFragment<Workbench, WorkbenchAdapter> {


    @Override
    protected void onSetup(View view, Bundle savedInstanceState) {
        this.showToolbar= true;
        this.refreshable= false;
        this.loadMore= false;
        super.onSetup(view, savedInstanceState);
        setTitle("信息查询");
      //  loadData(false, false);
    }

    @Override
    protected void loadData(boolean refresh, boolean loadMore) {
        super.loadData(refresh, loadMore);

        List<Workbench> list = new ArrayList<>();

        Workbench workbench = new Workbench();

        workbench = new Workbench();
        workbench.setName("车辆查询");
        workbench.setPath("VehicleActivity");
        workbench.setIcon(R.mipmap.car_active);
        list.add(workbench);
        workbench = new Workbench();
        workbench.setName("企业查询");
        workbench.setPath("VehicleActivity");
        workbench.setIcon(R.mipmap.car_active);
        list.add(workbench);
        PageResult<Workbench> pagedResult = new PageResult<Workbench>( list,false );
        pagedResult.setTotalRow(1);
        onLoadNext(pagedResult, refresh, loadMore);

    }

    @Override
    protected void createAdapter() {
        mAdapter = new WorkbenchAdapter();
    }

    @Override
    public void onFirstVisible() {
        loadData(true, false);
    }

    @Override
    protected void cfgAdapter() {
        super.cfgAdapter();
        mAdapter.setOnItemClickListener((baseQuickAdapter, view, i) -> {
            Workbench data = (Workbench) view.getTag();
            if (data == null) {
                ToastUtils.showCustomLong(R.string.msg_data_error);
            } else {
                onItemClick(data);
            }
        });
    }

    protected void onItemClick(Workbench data) {
        Router.build(data.getPath())
                .go(this);
    }

    @Override
    protected RecyclerView.LayoutManager getLayoutManager() {
        return super.getGridLayoutManager(GridLayoutManager.VERTICAL,2);
    }

    @Override
    protected void cfgItemDecoration() {
        mRecyclerView.addItemDecoration(new SpaceDecoration(2));
    }



}
