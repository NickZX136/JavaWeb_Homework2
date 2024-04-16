package com.dao;

import com.vo.Classes;

import java.util.List;

public interface IClassesDAO {
    public Classes findClassesById (int ClassId) throws Exception;
    public List<Classes> findAllClasses() throws Exception;
}
