package hr.web.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.pojo.Config_primary_key;
import hr.pojo.Salary_item;
import hr.pojo.Salary_standard;
import hr.pojo.Salary_standard_details;
import hr.service.ConfigPrimaryKeyService;
import hr.service.Salary_itemService;
import hr.service.Salary_standardService;
import hr.service.Salary_standard_detailsService;

@Controller
@RequestMapping("/salary_standard")
public class Salary_standardController {
	@Autowired
	private Salary_standardService service = null;
	@Autowired
	private Salary_itemService itemSerice =  null;
	@Autowired
	private Salary_standard_detailsService detailService = null;
	@Autowired
	private ConfigPrimaryKeyService publicService = null;
	
	
	@RequestMapping("/register.do")
	public String registerSalary_item(@RequestParam("standard_id") String standard_id,
			@RequestParam("standard_name") String standard_name,
			@RequestParam("designer") String designer,
			@RequestParam("remark") String remark,@RequestParam("salaryList") String salaryList,
			@RequestParam("itemIdList") String itemIdList,@RequestParam("itemNameList") String itemNameList){
		Timestamp t = new Timestamp(new Date().getTime());
		double salary = 0.00;
		String[] slist= salaryList.split(",");
		String[] idlist = itemIdList.split(",");
		String[] namelist = itemNameList.split(",");
		
//		保存薪资详情
		Salary_standard_details details = new Salary_standard_details();
		int sdtID = service.querySalary_standard().size() + 1;
		details.setSdt_id(sdtID);
		details.setStandard_id(standard_id);
		details.setStandard_name(standard_name);
		
		for (int i = 0; i < slist.length; i++) {
			double d = Double.parseDouble(slist[i]);
			salary += d;
			details.setSalary(d);
			details.setItem_id(Integer.valueOf(idlist[i]));
			details.setItem_name(namelist[i]);
			//根据薪酬插入薪酬标准详情
			detailService.addSalary_standard_details(details);
		}
		Salary_standard ss = new Salary_standard();
		ss.setStandard_id(standard_id);
		ss.setStandard_name(standard_name);
		ss.setDesigner(designer);
		ss.setRegist_time(t);
		ss.setRemark(remark);
		ss.setSalary_sum(salary);
		ss.setCheck_status(0);
		ss.setChange_status(0);
		service.addSalary_standard(ss);
		
		return "redirect:/salarystandard_register_success.jsp";
	}
	@RequestMapping("queryAll.do")
	public String queryAllsalary_standard(Model model){
		List<Salary_standard> list = service.querySalary_standard();
		model.addAttribute("list",list);
		Iterator<Salary_standard> it = list.iterator();
		while(it.hasNext()) {
			Salary_standard ss = it.next();
			if (ss.getCheck_status() == 1) {
				it.remove();
			}
		}
		
		return "forward:/salarystandard_check_list.jsp";
	}
	@RequestMapping("/check.do")
	public String checksalary_standard(@RequestParam("ssd_id") int ssd_id,Model model){
		Timestamp time = new Timestamp(new Date().getTime());
		Salary_standard salaryStandard = service.querySalary_standardById(ssd_id);
		model.addAttribute("salaryStandard",salaryStandard);
		model.addAttribute("time",time);
		List<Salary_standard_details> detailList = 
				detailService.querySalary_standard_detailsByStandardId(salaryStandard.getStandard_id());
		model.addAttribute("detailList", detailList);
		
		return "forward:/salarystandard_check.jsp";
	}
	
	@RequestMapping("/modify.do")
	public String modifySalaryStandard(@ModelAttribute Salary_standard salaryStanard,ItemListDto listdto) {
		List<Salary_standard_details> list = listdto.getList();
		double salaryNum = 0;
		for (Salary_standard_details salary_standard_details : list) {
			salaryNum += salary_standard_details.getSalary();
			salary_standard_details.setStandard_id(salaryStanard.getStandard_id());
			detailService.modifySalaryStandardDetailsByItemID(salary_standard_details);
		}
		salaryStanard.setCheck_status(1);
		salaryStanard.setChange_status(0);
		salaryStanard.setSalary_sum(salaryNum);
		service.modifySalary_standard(salaryStanard);
		
		return "redirect:/salarystandard_register_success.jsp";
	}
	
	@RequestMapping("/queryList.do")
	public String queryListSalaryStandard(String query,String standardId,String primarykey,
			Timestamp startTime,Timestamp endTime,Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(standardId+"=="+primarykey+"=="+startTime+"=="+endTime);
		if (standardId != null && !"".equals(standardId)) {
			map.put("standardId", standardId);
		}
		if (primarykey != null && !"".equals(primarykey)) {
			map.put("primarykey", primarykey);
		}
		if (startTime != null) {
			map.put("startTime", startTime);
		}
		if (endTime != null) {
			map.put("endTime", endTime);
		}
		//关键字
		List<Config_primary_key> prmlist = publicService.queryConfig_primary_key_byPk("salaryStandard");
		map.put("prmlist",prmlist);
		
		List<Salary_standard> salaryList = service.querySalaryStandardCondition(map);
		model.addAttribute("salaryList", salaryList);
		model.addAttribute("max", salaryList.size());
		
		if ("query".equals(query)) {
			return "forward:/salarystandard_query_list.jsp";
		}
		if ("change".equals(query)) {
			return "forward:/salarystandard_change_list.jsp";
		}
		
		return "forward:/salarystandard_query_list.jsp";
	}
	
	@RequestMapping("/queryOne.do")
	public String queryOneSalaryStandard(@RequestParam("ssd_id") int ssd_id,String caozuo,Model model) {
		Salary_standard salarystandard = service.querySalary_standardById(ssd_id);
		List<Salary_standard_details> detailList = 
				detailService.querySalary_standard_detailsByStandardId(salarystandard.getStandard_id());
		model.addAttribute("salary", salarystandard);
		model.addAttribute("detailList", detailList);
		Timestamp time = new Timestamp(new Date().getTime());
		model.addAttribute("time", time);
		
		if ("query".equals(caozuo)) {
			return "forward:/salarystandard_query.jsp";
		}
		if ("change".equals(caozuo)) {
			return "forward:/salarystandard_change.jsp";
		}
		
		return null;
	}
	
	@RequestMapping("/change.do")
	public String changeSalaryStandard(@ModelAttribute Salary_standard salaryStanard,ItemListDto listdto) {
		List<Salary_standard_details> list = listdto.getList();
		double salaryNum = 0;
		for (Salary_standard_details salary_standard_details : list) {
			salaryNum += salary_standard_details.getSalary();
			salary_standard_details.setStandard_id(salaryStanard.getStandard_id());
			detailService.modifySalaryStandardDetailsByItemID(salary_standard_details);
		}
		salaryStanard.setSalary_sum(salaryNum);
		service.modifySalary_standard(salaryStanard);
		
		return "redirect:/salarystandard_change_success.jsp";
	}
}
