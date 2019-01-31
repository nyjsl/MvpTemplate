<?xml version="1.0" encoding="utf-8"?>
<com.qmuiteam.qmui.widget.QMUIWindowInsetLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

<#if ptr>
    <android.support.v4.widget.SwipeRefreshLayout
        android:id="@+id/refresh"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_marginTop="?attr/qmui_topbar_height"
        android:fitsSystemWindows="true"
        android:orientation="vertical">
        <FrameLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent">
        <android.support.v7.widget.RecyclerView
            android:id="@+id/${extractLetters(fragmentName?lower_case)}_list"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:scrollbars="none"/>

            <include
                android:id="@+id/error_layout"
                layout="@layout/view_error"
                android:visibility="gone"></include>

        </FrameLayout>
    </android.support.v4.widget.SwipeRefreshLayout>
        
<#else>
     <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_marginTop="?attr/qmui_topbar_height"
        android:fitsSystemWindows="true"
        android:orientation="vertical">

    </LinearLayout>
</#if>
    
    <com.qmuiteam.qmui.widget.QMUITopBarLayout
        android:id="@+id/topbar"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:fitsSystemWindows="true" />

</com.qmuiteam.qmui.widget.QMUIWindowInsetLayout>
