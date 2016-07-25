<?xml version="1.0"?>
<recipe>

    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <#if appCompat && !(hasDependency('com.android.support:recyclerview-v7'))>
       <dependency mavenUrl="com.android.support:recyclerview-v7:${buildApi}.+" />
    </#if>
     <#if appCompat && !(hasDependency('cn.bingoogolapple:bga-adapte'))>
       <dependency mavenUrl="com.android.support:recyclerview-v7:1.0.8@aar" />
    </#if>
     <#if appCompat && !(hasDependency('jp.wasabeef:recyclerview-animators'))>
       <dependency mavenUrl="jp.wasabeef:recyclerview-animators:2.2.3" />
    </#if>
     <#if appCompat && !(hasDependency('cn.bingoogolapple:bga-refreshlayout'))>
       <dependency mavenUrl="cn.bingoogolapple:bga-refreshlayout:1.1.4@aar" />
    </#if>
     
    <#if (buildApi gte 22) && appCompat && !(hasDependency('com.android.support:design'))>
        <dependency mavenUrl="com.android.support:design:${buildApi}.+" />
    </#if>
  
<#if generateLayout>
   <instantiate from="root/res/layout/activity_refreshlayout.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

</#if>

<#if generateAdapter && adapterClass??>
    <instantiate from="root/src/app_package/CommonAdater.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />
    <open file="${escapeXmlAttribute(srcOut)}/${adapterClass}.xml" />
</#if>

<#if generateItemLayout && itemLayoutName??>
    <instantiate from="root/res/layout/list_item_layout.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${itemLayoutName}.xml" />
</#if>


 <instantiate from="root/src/app_package/RefreshLayoutActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

</recipe>
