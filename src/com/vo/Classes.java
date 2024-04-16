package com.vo;

public class Classes {
    private int classId;
    private String className;

    public Classes(int classId, String classNAme) {
        this.classId = classId;
        this.className = classNAme;
    }

    public Classes(){

    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String classNAme) {
        this.className = classNAme;
    }

    @Override
    public String toString() {
        return "Classes{" +
                "classId='" + classId + '\'' +
                ", classNAme='" + className + '\'' +
                '}';
    }
}
