package com.letao.service.impl;

import com.letao.dao.StudentDao;
import com.letao.domain.Student;
import com.letao.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentDao studentDao;

    @Override
    public Student findStudentById(int id) {
        Student student = studentDao.findStudentById(id);
        return student;
    }

    @Override
    public List<Student> findStudents() {
        List<Student> students = studentDao.findStudents();
        return students;
    }

    @Override
    public int removeStudentById(int id) {
        int nums = studentDao.removeStudentById(id);
        return nums;
    }

    @Override
    public int addStudent(Student student) {
        int nums = studentDao.addStudent(student);
        return nums;
    }
}
