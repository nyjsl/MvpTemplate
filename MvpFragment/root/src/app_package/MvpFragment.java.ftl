
<#if ptr>

<#if base>

package ${packageName};
import com.cw.common.component.mvp.ptr.Base<#if lazy>Lazy</#if>PtrMvpFragment;
import com.cw.common.component.mvp.ptr.BasePtrPresenter;
import com.cw.common.component.mvp.ptr.IBasePtrView;
import com.cw.ui.BaseLoadMoreView;
import com.qmuiteam.qmui.util.QMUIStatusBarHelper;
import android.os.Bundle;
import com.qmuiteam.qmui.widget.QMUITopBarLayout;
import com.chad.library.adapter.base.loadmore.LoadMoreView;
import android.support.annotation.NonNull;

public abstract class ${fragmentName}PtrBaseFragment<D,V extends IBasePtrView, P extends BasePtrPresenter<V>> extends Base<#if lazy>Lazy</#if>MvpFragment<V, P> {
    
    @BindView(R2.id.topbar)
    QMUITopBarLayout mTopBar;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
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

import com.alibaba.android.arouter.facade.annotation.Route;
import com.chad.library.adapter.base.BaseQuickAdapter;
import com.chad.library.adapter.base.loadmore.LoadMoreView;
import com.cw.common.component.mvp.pfactory.annotations.CreatePresenterAnnotation;
import com.cw.common.component.mvp.ptr.Base<#if lazy>Lazy</#if>PtrMvpFragment;
import com.cw.global.constants.router.RouterPath;
import com.chad.library.adapter.base.BaseQuickAdapter;
import java.util.List;
import butterknife.BindView;
import com.cw.ui.BaseLoadMoreView;
import android.view.View;
import android.support.annotation.NonNull;

@CreatePresenterAnnotation(${presenterName}.class)
@Route(path = RouterPath.${extractLetters(fragmentName?upper_case)}_FRAGMENT) // 路由地址，必须注明
public class ${fragmentClass} extends Base<#if lazy>Lazy</#if>PtrMvpFragment<D,${contractName}.View, ${presenterName}>
        implements ${contractName}.View {


   @Override
    public int getFragmentLayout() {
       return R.layout.${layoutName};
    }


   @Override
    protected void initComps(View view) {
        refreshLayout = view.findViewById(R.id.refresh);
        recyclerView = view.findViewById(R.id.${extractLetters(fragmentName?lower_case)}_list);
        errorlayout = view.findViewById(R.id.error_layout);
    }

    @Override
    protected void loadMoreOption() {
        //TODO
    }

    @Override
    protected void refreshOption() {
        //TODO
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

    @Override
    protected BaseQuickAdapter getAdapter(List<D> datas) {
        return new ${fragmentName}Adapter(datas);
    }


    @Override
    protected void initView(View root) {
        super.initView(root);
    }

    @Override
    protected void initData() {
        super.initData();
    }

<#if lazy>
    @Override
    protected void loadData() {
    }
</#if>

    @Override
    public ${fragmentClass} getFragment() {
        return this;
    }

}


</#if>

<#else>

<#if base>


package ${packageName};
import com.cw.common.component.Base<#if lazy>Lazy</#if>MvpFragment;
import com.cw.common.component.IBaseView;
import com.cw.common.component.mvp.BasePresenter;

public abstract class ${fragmentName}BaseFragment<V extends IBaseView, P extends BasePresenter<V>> extends Base<#if lazy>Lazy</#if>MvpFragment<V, P> {

}

<#else>

package ${packageName};
import com.alibaba.android.arouter.facade.annotation.Route;
import com.alibaba.android.arouter.launcher.ARouter;
import com.cw.global.constants.router.RouterPath;
import com.cw.common.component.mvp.pfactory.annotations.CreatePresenterAnnotation;
import butterknife.BindView;
import android.view.View;
import com.cw.common.component.mvp.Base<#if lazy>Lazy</#if>MvpFragment;

@SuppressLint("Registered")
@CreatePresenterAnnotation(${presenterName}.class)
@Route(path = RouterPath.${extractLetters(fragmentName?upper_case)}_FRAGMENT)
public class ${fragmentClass} extends Base<#if lazy>Lazy</#if>MvpFragment<${contractName}.View, ${presenterName}>
        implements ${contractName}.View{

    @Override
    public int getFragmentLayout() {
       return R.layout.${layoutName};
    }

    @Override
    protected void initView(View root) {
        super.initView();
    }

    @Override
    protected void initData() {
        super.initData();
    }
<#if lazy>
    @Override
    protected void loadData() {
    }
</#if>

    @Override
    public ${fragmentClass} getFragment() {
        return this;
    }


}

</#if>

</#if>




