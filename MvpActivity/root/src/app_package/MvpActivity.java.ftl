<#if ptr>

<#if base>

package ${packageName};
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.chad.library.adapter.base.loadmore.LoadMoreView;
import com.cw.common.component.mvp.ptr.BasePtrMvpActivity;
import com.cw.common.component.mvp.ptr.BasePtrPresenter;
import com.cw.common.component.mvp.ptr.IBasePtrView;
import com.cw.ui.BaseLoadMoreView;
import com.qmuiteam.qmui.util.QMUIStatusBarHelper;
import com.qmuiteam.qmui.widget.QMUITopBarLayout;
import butterknife.BindView;

public abstract class ${activityName}PtrBaseActivity<D,V extends IBasePtrView<D>, P extends BasePtrPresenter<V>> extends BasePtrMvpActivity<D,V, P> {

    @BindView(R2.id.topbar)
    QMUITopBarLayout mTopBar;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        QMUIStatusBarHelper.setStatusBarLightMode(this);
        if(null!= mTopBar){
            mTopBar.addLeftBackImageButton().setOnClickListener(v -> finish());
        }
    }

    @Override
    protected int getEmptyViewId() {
        return R.layout.view_empty;
    }

    @NonNull
    @Override
    protected LoadMoreView getLoadMoreView() {
        return new BaseLoadMoreView();
    }

    protected void setTitleRes(int resId){
        if(null == mTopBar){
            return;
        }
        mTopBar.setTitle(resId);
    }

    protected void setTitleStr(String titleStr){
        if(null == mTopBar){
            return;
        }
        mTopBar.setTitle(titleStr);
    }
}


<#else>

package ${packageName};
import android.annotation.SuppressLint;
import android.os.Bundle;
import com.alibaba.android.arouter.facade.annotation.Route;
import com.chad.library.adapter.base.BaseQuickAdapter;
import com.cw.common.component.mvp.pfactory.annotations.CreatePresenterAnnotation;
import com.cw.global.constants.router.RouterExtraKey;
import com.cw.global.constants.router.RouterPath;
import ${packageName}.${contractName};
import ${packageName}.${presenterName};

import java.util.List;

/**
 */
@SuppressLint("Registered")
@CreatePresenterAnnotation(${presenterName}.class)
@Route(path = RouterPath.${extractLetters(activityName?upper_case)}_ACTIVITY)
public class ${activityClass} extends BasePtrMvpActivity<D,${contractName}.View, ${presenterName}>
        implements ${contractName}.View{

    @Override
    public int setLayoutId() {
          return R.layout.${layoutName};
    }

    @Override
    protected void initComps() {
        refreshLayout = findViewById(R.id.refresh);
        recyclerView = findViewById(R.id.${extractLetters(activityName?lower_case)}_list);
        errorlayout = findViewById(R.id.error_layout);
    }

    @Override
    protected BaseQuickAdapter getAdapter(List<D> datas) {
        return new ${activityName}ListAdapter(datas);
    }

    @Override
    protected void initView(Bundle savedInstanceState) {
        super.initView(savedInstanceState);
    }

    @Override
    public ${activityClass} getThis() {
        return this;
    }

      @Override
    protected void loadMoreOption() {
        //TODO
    }

    @Override
    protected void refreshOption() {
        //TODO
    }

}


</#if>

<#else>

<#if base>

package ${packageName};
import android.os.Bundle;
import android.support.annotation.Nullable;
import com.cw.common.component.IBaseView;
import com.cw.common.component.mvp.BaseMvpActivity;
import com.cw.common.component.mvp.BasePresenter;
import com.qmuiteam.qmui.util.QMUIStatusBarHelper;
import com.qmuiteam.qmui.widget.QMUITopBarLayout;
import butterknife.BindView;

public abstract class ${activityName}BaseActivity<V extends IBaseView, P extends BasePresenter<V>> extends BaseMvpActivity<V, P> {


    @BindView(R2.id.topbar)
    QMUITopBarLayout mTopBar;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        QMUIStatusBarHelper.setStatusBarLightMode(this);
        if(null!= mTopBar){
            mTopBar.addLeftBackImageButton().setOnClickListener(v -> finish());
        }
    }

    protected void setTitleRes(int resId){
        if(null == mTopBar){
            return;
        }
        mTopBar.setTitle(resId);
    }
    protected void setTitleStr(String titleStr){
        if(null == mTopBar){
            return;
        }
        mTopBar.setTitle(titleStr);
    }

}

<#else>

package ${packageName};
import android.annotation.SuppressLint;
import android.os.Bundle;
import com.cw.common.component.mvp.BaseMvpActivity;
import com.cw.common.component.mvp.pfactory.annotations.CreatePresenterAnnotation;
import ${packageName}.${contractName};
import ${packageName}.${presenterName};
import butterknife.BindView;
import com.alibaba.android.arouter.facade.annotation.Route;
import com.alibaba.android.arouter.launcher.ARouter;
import com.cw.global.constants.router.RouterPath;
@SuppressLint("Registered")
@CreatePresenterAnnotation(${presenterName}.class)
@Route(path = RouterPath.${extractLetters(activityName?upper_case)}_ACTIVITY)
public class ${activityClass} extends BaseMvpActivity<${contractName}.View, ${presenterName}>
        implements ${contractName}.View {

    @Override
    public int setLayoutId() {
        return R.layout.${layoutName};
    }

    @Override
    protected void initData() {
    }

    @Override
    protected void initView(Bundle savedInstanceState) {
    }

    @Override
    public ${activityClass} getThis() {
        return this;
    }
}

</#if>

</#if>

