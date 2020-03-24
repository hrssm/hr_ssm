package hr.web.controller;

import java.sql.Timestamp;
import java.util.Date;
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
import hr.util.GetHumanFileId;

@Controller
@RequestMapping("/salary_item")
public class Salary_itemController {
	@Autowired
	private Salary_itemService service = null;
	@Autowired
	private Salary_standardService standardService = null;
	
	private Timestamp t = null;
	private int id = 0;
	private int number = 0;
	
	@RequestMapping("/query.do")
	public String querySalary_item(Model model){
		List<Salary_item> list = service.querySalary_item();
		model.addAttribute("list", list);
		model.addAttribute("max", list.size());
		return "forward:/salary_item.jsp";
	}
	@RequestMapping("/register.do")
	public String registerSalary_item(@ModelAttribute Salary_item s){
		boolean flag;
		int number = 0;
		List<Salary_item> list = service.querySalary_item();
		for (Salary_item s1 : list) {
			number = s1.getItem_number();
		}
		if (number != s.getItem_number()) {
			flag =  service.addSalary_item(s);
		} else {
			return "redirect:/salary_item_error.jsp";
		}
		if (flag) {
			return "redirect:/salary_item/query.do";
		} else {
			return "redirect:/salary_item.jsp";
		}
	}
	@RequestMapping("/change.do")
	public String changeSalary_item(@RequestParam("item_id") int item_id,Model model){
		Salary_item si = service.querySalary_itemById(item_id);
		id = si.getItem_id();
		number = si.getItem_number();
		model.addAttribute("item", si);
		return "forward:/salary_item_change.jsp";
	}
	@RequestMapping("/modify.do")
	public String modifySalary_item(@ModelAttribute Salary_item s){
		s.setItem_id(id);
		s.setItem_number(number);
		service.modifySalary_item(s);
		return "redirect:/salary_item/query.do";
	}
	@RequestMapping("/remove.do")
	public String removeSalary_item(@RequestParam("item_id") int item_id){
		service.removeSalary_itemById(item_id);
		return "redirect:/salary_item/query.do";
	}
	@RequestMapping("/queryAll.do")
	public String queryAllSalary_item(Model model){
		t = new Timestamp(new Date().getTime());
		List<Salary_item> list = service.querySalary_item();
		model.addAttribute("list", list);
		model.addAttribute("t", t);
		List<Salary_standard> slist = standardService.querySalary_standard();
		model.addAttribute("standard_id", GetHumanFileId.getSalaryIdById(slist.size()));
		return "forward:/salarystandard_register.jsp";
	}
}
