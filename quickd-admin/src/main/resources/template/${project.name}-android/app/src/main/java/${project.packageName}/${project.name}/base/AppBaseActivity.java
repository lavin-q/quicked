package ${project.group}.${project.name}.base;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.OrientationHelper;
import android.support.v7.widget.RecyclerView;
 import android.support.v7.widget.StaggeredGridLayoutManager;
import com.afollestad.materialdialogs.MaterialDialog;
import com.blankj.utilcode.util.AppUtils;
import com.blankj.utilcode.util.ToastUtils;
import com.chenenyu.router.Router;
import com.idogfooding.backbone.network.ApiException;
import com.idogfooding.backbone.ui.BaseActivity;
import com.quickd.R;
import com.quickd.App;
import com.tencent.bugly.crashreport.CrashReport;
import com.quickd.photopicker.GlideEngine;
import com.huantansheng.easyphotos.EasyPhotos;
import com.idogfooding.backbone.RequestCode;
import com.idogfooding.backbone.photo.PhotoPickerAdapter;
import com.idogfooding.backbone.photo.PhotoPickerEntity;

import butterknife.BindView;

/**
 * AppBaseActivity
 *
 * @author Charles
 */
public abstract class AppBaseActivity extends BaseActivity {

    // 多图片
    @Nullable
    @BindView(R.id.rv_photos)
    RecyclerView rvPhotos;
    protected PhotoPickerAdapter photoAdapter;
    @Override
    protected void onSetup(Bundle savedInstanceState) {
        super.onSetup(savedInstanceState);
        if (toolbar != null) {
            toolbar.setRightTextDrawableHeight(45).setRightTextDrawableWidth(45).setLeftTextDrawableHeight(45).setLeftTextDrawableWidth(45);
        }
    }

    protected void handleApiError(Throwable throwable) {
        if (throwable instanceof ApiException) {
            ApiException apiException = (ApiException) throwable;
            if (apiException.isUnauthorized()) {
                App.getInstance().clearUserLogin();
                new MaterialDialog.Builder(this)
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
    /**
     * 初始化多图选择器
     */
    protected void initPhotoPicky() {
        if (null == rvPhotos) {
            return;
        }
        photoAdapter = new PhotoPickerAdapter(null);
        photoAdapter.setDeleteEnable(false);
        photoAdapter.setMoreEnable(false);
        photoAdapter.setOnItemClickListener((adapter, view, position) -> {
            clearEditTextFocus();
            PhotoPickerEntity photoEntity = (PhotoPickerEntity) adapter.getItem(position);
            if (null == photoEntity) {

            } else if (photoEntity.getType() == PhotoPickerEntity.TYPE_ADD) {
                EasyPhotos.createAlbum(this, true, GlideEngine.getInstance())
                        .setFileProviderAuthority(AppUtils.getAppPackageName() + ".camera.file.provider")
                        .setPuzzleMenu(false)
                        .setCleanMenu(false)
                        .setGif(false)
                        .setCount(9)
                        .setSelectedPhotoPaths(photoAdapter.getRawPhotos())
                        .start(RequestCode.PHOTO_MULT_PICKER);
            } else {
//                // todo
//                PhotoPreview.builder()
//                        .setPhotos(photoAdapter.getRawPhotos())
//                        .setCurrentItem(position)
//                        .setShowDeleteButton(true)
//                        .start(this, RequestCode.PHOTO_MULT_PREVIEW);

            }
        });
        rvPhotos.setLayoutManager(new StaggeredGridLayoutManager(4, OrientationHelper.VERTICAL));
        rvPhotos.setAdapter(photoAdapter);
    }
}
