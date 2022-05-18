package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.model.Student;
import com.example.demo.service.IstudentService;

@Controller
public class StudentController {
	
	@Autowired
	private IstudentService studentService;
	
	@GetMapping("/test")
	public String test() {
		return "index";
	}
	
	@GetMapping("/getAll")
	public String getAll(Model model) {
		model.addAttribute("listStudent",studentService.listAll());
		
		return "listStudent";
	}
	
	
	//api form student
	@GetMapping("/form/student")
	public String formStudent(Model model) {
		model.addAttribute("student",new Student());
		return "studentForm";
	}
	
	@PostMapping("/save/student")
	public RedirectView addStudent(RedirectAttributes redirectAttributes,@RequestParam(value = "id", required = false)int id, Student studentNew) {
									///RedirectAttributes redirectAttributes
		Student student;
		if( id !=  0) {
			student = studentService.getById(id);
		}else {
			student = new Student();
		}
		try {
		student.setFirstName(studentNew.getFirstName());
		student.setAge(studentNew.getAge());
		student.setLastName(studentNew.getLastName());
		student.setLopHoc(studentNew.getLopHoc());
		
		//adđ lỗi 
		
			studentService.addStudent(student);
		} catch (Exception e) {
			// TODO: handle exception
			String error = "oh.loi roi";
			// truyển 1 thuoocj tính hoặc đối tượng để redirect cho màn hình 
			redirectAttributes.addFlashAttribute("error", error);
			return new RedirectView("/form/student", true);
		}
		
		return new RedirectView("/getAll",true);// trả về getall - thay đổi cả đối tượng
		
	}
	@GetMapping("deleted/student")
	public RedirectView deleteById(@RequestParam("id") int id) {
		
		studentService.deleteStudentById(id);
		return new RedirectView("/getAll", true);
	}
	
	@GetMapping("/update/student")
	public String updateStudentById(@RequestParam("id")int id, Model model) {
		Student student = studentService.getById(id);
		model.addAttribute("student",student);
		return "studentForm";
	}

}
