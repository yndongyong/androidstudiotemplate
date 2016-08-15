package ${packageName};


import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;

import org.yndongyong.fastandroid.base.FaBaseActivity;

import cn.bingoogolapple.refreshlayout.BGANormalRefreshViewHolder;
import cn.bingoogolapple.refreshlayout.BGARefreshViewHolder;

import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import jp.wasabeef.recyclerview.animators.FadeInLeftAnimator;

import cn.bingoogolapple.androidcommon.adapter.BGARecyclerViewAdapter;
<#if generateItemClick>
import cn.bingoogolapple.androidcommon.adapter.BGAOnRVItemClickListener;
</#if>
import org.yndongyong.fastandroid.component.refreshlayout.DataSource;
<#if generateRefreshLayout>
import org.yndongyong.fastandroid.component.refreshlayout.RefreshLayout;
</#if>

<#if generateAA>
import org.androidannotations.annotations.AfterViews;
import org.androidannotations.annotations.EActivity;
import org.androidannotations.annotations.ViewById;
</#if>

import java.util.ArrayList;
import java.util.List;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

/**
 *
 * Create by Dong at 2016/07/21
 */
<#if generateAA>
@EActivity
</#if>
public class ${activityClass} extends FaBaseActivity {

    

    <#if generateRefreshLayout>
 
	<#if generateAA>
	@ViewById(R.id.refreshLayout)
	</#if>
	RefreshLayout mRefreshLayout;
    </#if>

    <#if generateAA>
    @ViewById(R.id.recyclerView)
    </#if>
    RecyclerView mRecyclerView;
    LinearLayoutManager mLinearLayoutManager;

    <#if generateAdapter&&adapterClass??>
    ${adapterClass} mAdapter;
    </#if>

     List<Object> mData = new ArrayList<>();

     private boolean isLoadMore = <#if isLoadMore>true <#else> false </#if>;
    
    @Override
    protected int getContentViewLayoutID() {
        return R.layout.<#if generateLayout>${layoutName}<#else>your_layout_name</#if>;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {	
	mTransitionMode = TransitionMode.RIGHT;
        super.onCreate(savedInstanceState);
	<#if hasToolbar>
	setTitle("标题"); 
	</#if>
	<#if !generateAA>
	//TODO findView
	<#if generateRefreshLayout>
	mRefreshLayout = (RefreshLayout) findViewById(R.id.refreshLayout);
	</#if>
        mRecyclerView =  (RecyclerView)findViewById(R.id.recyclerView);

	afterViews();
	</#if>

    }
    /**
     *  处理view的事件
     */
    <#if generateAA>
    @AfterViews
    </#if>
    void afterViews(){
	<#if generateAdapter && adapterClass??>
	mAdapter = new ${adapterClass}(mRecyclerView);
        mAdapter.setDatas(mData);

        mRecyclerView.setAdapter(mAdapter);
	</#if>

        mLinearLayoutManager = new LinearLayoutManager(this.mContext);
        mRecyclerView.setLayoutManager(mLinearLayoutManager);
        mRecyclerView.setItemAnimator(new FadeInLeftAnimator());

	<#if generateItemClick && generateRefreshLayout && generateAdapter && adapterClass??>
	mAdapter.setOnRVItemClickListener(new BGAOnRVItemClickListener() {
            @Override
            public void onRVItemClick(ViewGroup viewGroup, View view, int position) {
               //TODO 实现点击事件
	    }
        });
	</#if>
	<#if generateRefreshLayout>
	mRefreshLayout.setEmptyImage(R.mipmap.ico_empty);
        mRefreshLayout.setErrorImage(R.mipmap.ico_empty);
	
	BGARefreshViewHolder viewholder = new BGANormalRefreshViewHolder(this, isLoadMore);
        viewholder.setLoadingMoreText("正在卖力加载...");

	//需要实现viewholder
	mRefreshLayout.setRefreshViewHolder(viewholder, isLoadMore);
	mRefreshLayout.setDataSource(new DataSource(mContext) {
            @Override
            public void refreshData() {
		// 下拉刷新的方法;
                refresh();
            }

            @Override
            public boolean loadMore() {
		<#if isLoadMore>
			// 上拉加载更多的方法;返回true，支持上拉加载
			return  load();
			<#else>
			return  isLoadMore;
		</#if>
               
            }
        });
	// 刷新;
	 refresh();
	</#if>
    }
   
    <#if generateRefreshLayout>
    private void refresh() {
        //调用框架的loading动画，或者自己写一个       
        mRefreshLayout.showLoadingView();
	mData.clear();	
	<#if generateAdapter && adapterClass??>
        mAdapter.getDatas().clear();
	</#if>
        
	//TODO 实现网络请求
       
	//case1.失败
	//mRefreshLayout.showErrorView(error);
        
	//case2.无数据
	//mRefreshLayout.showEmptyView();      

	//case3.成功
	mRefreshLayout.endRefreshing();
	mRefreshLayout.showContentView();
	<#if generateAdapter && adapterClass??>
        mAdapter.clear();
        mAdapter.addNewDatas(mData);//添加新的数据集
	</#if>
	
    }
     </#if>

    <#if generateRefreshLayout&&isLoadMore??>
    private boolean load() {
	//TODO 判断数据是否全部加载完毕，如果是返回false

      	//调用框架的loading动画，或者自己写一个       
        mRefreshLayout.showLoadingView();
        
	//TODO 实现网络请求
       
	//case1.失败
	//mRefreshLayout.showErrorView(error);
        
	//case2.无数据
	//mRefreshLayout.showEmptyView();      

	//case3.成功
	<#if generateAdapter && adapterClass??>
        mAdapter.addMoreDatas(mData);//添加到原有数据集
	</#if>
        mRefreshLayout.endLoadingMore();

	return true;
    }
    </#if>
}
