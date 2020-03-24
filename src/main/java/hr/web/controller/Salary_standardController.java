package hr.web.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.pojo.Salary_item;
import hr.pojo.Salary_standard;
import hr.service.Salary_itemService;
import hr.service.Salary_standardService;

@Controller
@RequestMapping("/salary_standard")
public class Salary_standardController {
	@Autowired
	private Salary_standardService service = null;
	@Autowired
	private Salary_itemService itemSerice =  null;
	
	
	@RequestMapping("/register.do")
	public String registerSalary_item(@RequestParam("standard_id") String standard_id,
			@RequestParam("standard_name") String standard_name,
			@RequestParam("designer") String designer,
			@RequestParam("remark") String remark,@RequestParam("salaryList") String salaryList){
		Timestamp t = new Timestamp(new Date().getTime());
		double salary = 0.00;
		String[] slist= salaryList.split(",");
		for (String str : slist) {
			double d = Double.parseDouble(str);
			salary += d;
		}
		Salary_standard ss = new Salary_standard();
		ss.setStandard_id(standard_id);
		ss.setStandard_name(standard_name);
		ss.setDesigner(designer);
		ss.setRegist_time(t);
		ss.setRemark(remark);
		ss.setSalary_sum(salary);
		service.addSalary_standard(ss);
		return "redirect:/salarystandard_register_success.jsp";
	}
	@RequestMapping("queryAll.do")
	public String queryAllsalary_standard(Model model){
		List<Salary_standard> list = service.querySalary_standard();
		model.addAttribute("list",list);
		return "forward:/salarystandard_check_list.jsp";
	}
	@RequestMapping("check.do")
	public String checksalary_standard(@RequestParam("ssd_id") int ssd_id,Model model){
		Timestamp t = new Timestamp(new Date().getTime());
		Salary_standard ss = service.querySalary_standardById(ssd_id);
		List<Salary_item> list = itemSerice.querySalary_item();
		model.addAttribute("list",list);
		model.addAttribute("ss",ss);
		model.addAttribute("t",t);
		return "forward:/salarystandard_query.jsp";
	}
}
