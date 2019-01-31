<?xml version="1.0"?>
<recipe>
<#if !base&&generateLayout>
    <instantiate from="root/res/layout/activity_mvp.xml.ftl"
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
    <instantiate from="root/src/app_package/MvpActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityName}PtrBaseActivity.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityName}PtrBaseActivity.java" />
<#else>
    <instantiate from="root/src/app_package/MvpActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityName}BaseActivity.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityName}BaseActivity.java" />
</#if>
<#else>
    <instantiate from="root/src/app_package/MvpActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
</#if>

</recipe>
