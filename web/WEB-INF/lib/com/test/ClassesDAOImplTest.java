package com.test;

import com.factory.DAOFactory;
import com.vo.Classes;
import junit.framework.TestCase;

public class ClassesDAOImplTest extends TestCase {

    public void testFindClassesById() throws Exception {
        Classes classes = new Classes();
        classes.setClassId(10201811);
        Classes classes2 = DAOFactory.getClassesDAOInstance().findClassesById(classes.getClassId());
        System.out.println(classes2.getClassName());
    }

    public void testFindAllClasses() {
    }
}