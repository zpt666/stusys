package com.letao.controller;

import com.letao.domain.Student;
import com.letao.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {
    @Resource
    private StudentService studentService;

    @RequestMapping("/getStudents.do")
    @ResponseBody
    public List<Student> findStudents(){
        List<Student> students = studentService.findStudents();
        return students;
    }

    @RequestMapping("/removeStudentById.do")
    @ResponseBody
    public Map removeStudentById(int id){
        int nums = studentService.removeStudentById(id);
        HashMap<String,Integer> map = new HashMap<>();
        map.put("res",nums);
        return map;
    }

    @RequestMapping("/addStudent.do")
    @ResponseBody
    public Map addStudent(Student student){
        int nums = studentService.addStudent(student);
        HashMap<String,Integer> map = new HashMap<>();
        map.put("res",nums);
        return map;
    }
}
