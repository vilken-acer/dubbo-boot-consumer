package com.jk.pojo;


import java.io.Serializable;
import java.util.List;

public class Tree implements Serializable {

    private static final long serialVersionUID = -5011280005666243930L;

    private Integer id;

    private String text;

    private String href;

    private Integer pid;

    private String leaf;

    private String state;

    private List<Tree> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getLeaf() {
        return leaf;
    }

    public void setLeaf(String leaf) {
        this.leaf = leaf;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<Tree> getChildren() {
        return children;
    }

    public void setChildren(List<Tree> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Tree{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", href='" + href + '\'' +
                ", pid=" + pid +
                ", leaf='" + leaf + '\'' +
                ", state='" + state + '\'' +
                ", children=" + children +
                '}';
    }
}
