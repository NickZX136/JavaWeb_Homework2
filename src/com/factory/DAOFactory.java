package com.factory;

import com.dao.IClassesDAO;
import com.dao.IStudentsDAO;
import com.dao.impl.ClassesDAOImpl;
import com.dao.impl.StudentsDAOImpl;

public class DAOFactory {
    public static IStudentsDAO getStudentsDAOInstance() throws Exception{
        return new StudentsDAOImpl();
    }

    public static IClassesDAO getClassesDAOInstance() throws Exception{
        return new ClassesDAOImpl();
    }

}
