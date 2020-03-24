package hr.web.controller;

import java.util.List;

import org.apache.ibatis.scripting.xmltags.WhereSqlNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.pojo.Config_primary_key;
import hr.pojo.HumanFile;
import hr.pojo.MajorChange;
import hr.pojo.Salary_standard;
import hr.service.Config_primary_keyService;
import hr.service.HumanFileService;
import hr.service.MajorChangeService;
import hr.service.Salary_standardService;

@Controller
@RequestMapping("/keyword")
public class KeywordController {
	@Autowired
	private HumanFileService humanService = null;
	@Autowired
	private Salary_standardService ssService = null;
	@Autowired
	private MajorChangeService majorService = null;
	@Autowired
	private Config_primary_keyService keyService = null;
	
	@RequestMapping("queryAll.do")
	public String queryAllsalary_standard(Model model,@RequestParam("value") String value){
		String humanFile = "HumanFile";//人力资源
		String salaryStandard = "SalaryStandard";//薪酬标准
		if (humanFile.equals(value)) {
			return "forward:/primary_key_register_humanFile.jsp";			
		} else if(salaryStandard.equals(value)){
			return "forward:/primary_key_register_salaryStandard.jsp";
		}else {
			return null;
		}
	}
	
	@RequestMapping("table.do")
	public String humanFilekeyword(@RequestParam("table") String table,@RequestParam("s") String s){
		String[] list = s.split(",");
//		System.out.println(list.length);
//		for (String string : list) {
//			System.out.println(string);
//		}
		for (int i = 0; i < list.length; i++) {
//			int j = 1;
//			j += i;
//			System.out.println(list[i]);
//			System.out.println(list[i+1]);
			Config_primary_key ck = new Config_primary_key();
			ck.setPrimary_key_table(table);
			ck.setKey_name(list[i]);
			ck.setPrimary_key(list[i+1]);
			ck.setPrimary_key_status(1);
			keyService.addConfig_primary_key(ck);
			i++;
		}
		return "forward:/register_success.jsp";
	}
}
