
<#if ptr>

package ${packageName};
import com.cw.common.component.mvp.ptr.BasePtrPresenter;
import com.cw.common.component.mvp.ptr.IBasePtrView;

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
import com.cw.common.component.mvp.BasePresenter;
import com.cw.common.component.IBaseView;
import ${packageName}.${activityClass};

public interface ${contractName} {

    interface View extends IBaseView {
        ${activityClass} getThis();
    }

    abstract class Presenter extends BasePresenter<View> {

    }

}

</#if>

