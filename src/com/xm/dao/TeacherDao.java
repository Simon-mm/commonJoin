package com.xm.dao;

import com.xm.bean.Teacher;

import java.util.List;

public interface TeacherDao {

    public Teacher getTeacherById(Integer id);

    public List<Teacher> getAllTeachers();
}
