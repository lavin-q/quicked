package ${project.group}.${project.name}.workbench;

import com.chad.library.adapter.base.BaseQuickAdapter;
import com.chad.library.adapter.base.BaseViewHolder;
import ${project.group}.${project.name}.R;

/**
 * AlarmAdapter
 *
 * @author Charles
 */
public class WorkbenchAdapter extends BaseQuickAdapter<Workbench, BaseViewHolder> {

    public WorkbenchAdapter() {
        super(R.layout.workbench_item);
    }

    @Override
    protected void convert(BaseViewHolder holder, Workbench data) {
        holder.setTag(R.id.root_item, data)
                .setText(R.id.name_tv, data.getName())
                .setImageResource(R.id.icon_iv, data.getIcon());
    }
}
