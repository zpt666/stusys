package com.letao.service;

import com.letao.domain.Student;

import java.util.List;

public interface StudentService {
    Student findStudentById(int id);

    List<Student> findStudents();

    int removeStudentById(int id);

    int addStudent(Student student);
}
