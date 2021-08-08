package com.letao.dao;

import com.letao.domain.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentDao {
    @Select("select * from students where id=#{id}")
    Student findStudentById(int id);

    @Select("select * from students")
    List<Student> findStudents();

    @Delete("delete from students where id=#{id}")
    int removeStudentById(int id);

    @Insert("insert into students values(#{id},#{name},#{age},#{sex})")
    int addStudent(Student student);
}

