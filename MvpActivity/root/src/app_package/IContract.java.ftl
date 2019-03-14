
<#if ptr>

package ${packageName};
import com.cw.base.component.mvp.ptr.BasePtrPresenter;
import com.cw.base.component.mvp.ptr.IBasePtrView;

import io.reactivex.Observable;

public interface ${contractName} {

    interface View extends IBasePtrView<D> {
    }

    abstract class Presenter extends BasePtrPresenter<View> {

        @Override
        public void getList(int page, Object... args) {
        }
    }

}


<#else>

package ${packageName};
import com.cw.base.component.mvp.BasePresenter;
import com.cw.base.component.mvp.IBaseView;
import ${packageName}.${activityClass};

public interface ${contractName} {

    interface View extends IBaseView {
        ${activityClass} getThis();
    }

    abstract class Presenter extends BasePresenter<View> {

    }

}

</#if>

