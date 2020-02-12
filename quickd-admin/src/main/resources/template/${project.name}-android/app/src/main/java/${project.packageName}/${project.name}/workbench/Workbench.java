package ${project.group}.${project.name}.workbench;

import com.idogfooding.backbone.network.BaseEntity;

/**
 * Workbench
 *
 * @author Charles
 */
public class Workbench extends BaseEntity {

    private String name;
    private int icon;
    private String path;
    private String lable;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIcon() {
        return icon;
    }

    public void setIcon(int icon) {
        this.icon = icon;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getLable() {
        return lable;
    }

    public void setLable(String lable) {
        this.lable = lable;
    }
}
