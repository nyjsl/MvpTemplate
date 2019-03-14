
<#if ptr>

package ${packageName};
import com.cw.base.component.mvp.ptr.BasePresenter;
import  com.cw.base.component.mvp.ptr.IBasePtrView;

import io.reactivex.Observable;

public interface ${contractName} {

    interface View extends IBasePtrView<D> {
       ${fragmentClass} getFragment();
    }

    abstract class Presenter extends BasePtrPresenter<View> {

        @Override
        public void getList(int page, Object... args) {
        }
    }

}


<#else>

package ${packageName};
import com.cw.common.component.mvp.BasePresenter;
import com.cw.common.component.IBaseView;
import ${packageName}.${fragmentClass};

public interface ${contractName} {

    interface View extends IBaseView {
        ${fragmentClass} getFragment();
    }

    abstract class Presenter extends BasePresenter<View> {

    }

}

</#if>

