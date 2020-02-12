package ${project.group}.${project.name}.network;

import java.io.Serializable;

/**
 * ApiHttpResult
 *
 * @author elvis
 */
public class ApiHttpResult<T> implements Serializable {


    private int code;
    private String msg;
    private T data;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
