
<#if ptr>

package ${packageName};

import com.cw.common.net.base.BasePagableReq;
import ${packageName}.${contractName};

public class ${presenterName} extends ${contractName}.Presenter {

    private static final String TAG = "${presenterName}";

    @Override
    public BasePagableReq argToReq(Object... args) {
        //TODO
        return null;
    }
}


<#else>
package ${packageName};
import ${packageName}.${contractName};

public class ${presenterName} extends ${contractName}.Presenter {

    private static final String TAG = "${presenterName}";

}
</#if>
