package com.dao;

import com.vo.Students;
import java.util.List;

public interface IStudentsDAO {
    public boolean insertStudents(Students students) throws Exception;
    public boolean deleteStudents(String studentId) throws Exception;
    public boolean updateStudentsName(Students students) throws Exception;
    public boolean updateStudentsPassword(Students students) throws Exception;
    public boolean updateStudentsGender(Students students) throws Exception;
    public boolean updateStudentsClassName(Students students) throws Exception;
    public List<Students> findAllStudents() throws Exception;
    public Students findStudentsById(String studentId) throws Exception;
    public List<Students> findStudentsByFuzzyQuery(String findStudent) throws Exception;

}
