<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context="${packageName}.${activityClass}">


    <#if hasToolbar>
	    <include
		android:id="@+id/common_toolbar"
		layout="@layout/common_toolbar"
		android:layout_width="match_parent"
		android:layout_height="wrap_content"/>
    </#if>
    <#if generateRefreshLayout>
    <org.yndongyong.fastandroid.component.refreshlayout.RefreshLayout
        android:id="@+id/refreshLayout"
        android:layout_width="match_parent"
        android:layout_height="match_parent">
    </#if>

        <android.support.v7.widget.RecyclerView
            android:id="@+id/recyclerView"
            android:layout_width="match_parent"
            android:layout_height="0dip"
            android:layout_weight="1"
	    android:overScrollMode="never"
           />

	<#if generateRefreshLayout>
		</org.yndongyong.fastandroid.component.refreshlayout.RefreshLayout>
	</#if>
</LinearLayout>