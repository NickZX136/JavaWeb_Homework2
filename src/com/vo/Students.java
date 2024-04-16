package com.vo;

public class Students {
    private String studentId;
    private String studentName;
    private String studentPwd;
    private String sex;
    private int classId;
    //各属性的setter、getter方法
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentPwd() {
        return studentPwd;
    }

    public void setStudentPwd(String studentPwd) {
        this.studentPwd = studentPwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public Students(){

    }

    public Students(String studentId, String studentName, String studentPwd, String sex, int classId) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentPwd = studentPwd;
        this.sex = sex;
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "Students{" +
                "studentId='" + studentId + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentPwd='" + studentPwd + '\'' +
                ", sex='" + sex + '\'' +
                ", classId=" + classId +
                '}';
    }
}
