package com.xm.service;

import com.xm.bean.Teacher;
import com.xm.dao.TeacherDao;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherService {

//    @Autowired
//    private SqlSessionFactory factory;

    @Autowired
    TeacherDao teacherDao;

    public Teacher getTeacher(Integer id){
        return teacherDao.getTeacherById(id);
    }

    public List<Teacher> getAll() {
        return teacherDao.getAllTeachers();
    }
}
