package ${packageName};

import android.support.v7.widget.RecyclerView;

import cn.bingoogolapple.androidcommon.adapter.BGARecyclerViewAdapter;
import cn.bingoogolapple.androidcommon.adapter.BGAViewHolderHelper;

/**
 * Created by Dong on 2016/7/22.
 */
public class  ${adapterClass} extends BGARecyclerViewAdapter<Object> {


    public ${adapterClass}(RecyclerView recyclerView) {
	<#if generateItemLayout && itemLayoutName??>
	super(recyclerView,R.layout.${itemLayoutName});
	<#else>
	super(recyclerView,R.layout.your_list_item);
	</#if >
    }

    @Override
    protected void fillData(BGAViewHolderHelper helper, int i, Object item) {
        //TODO  helper.getView(R.id);
    }
}