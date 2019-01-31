<?xml version="1.0"?>
<recipe>

<#if !base&&generateLayout>
    <instantiate from="root/res/layout/fragment_mvp.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml"/>
</#if>
<#if !base>
    <instantiate from="root/src/app_package/IContract.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${contractName}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${contractName}.java" />
</#if>
<#if !base>
     <instantiate from="root/src/app_package/Presenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${presenterName}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${presenterName}.java" />
</#if>
<#if base>
<#if ptr>
    <instantiate from="root/src/app_package/MvpFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${fragmentName}PtrBaseFragment.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${fragmentName}PtrBaseFragment.java" />
<#else>
    <instantiate from="root/src/app_package/MvpFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${fragmentName}BaseFragment.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${fragmentName}BaseFragment.java" />
</#if>
<#else>
    <instantiate from="root/src/app_package/MvpFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${fragmentClass}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${fragmentClass}.java" />
</#if>

</recipe>



