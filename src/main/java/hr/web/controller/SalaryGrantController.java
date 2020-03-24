package hr.web.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.pojo.ConfigFileSecondKind;
import hr.pojo.HumanFile;
import hr.pojo.Salary_grant;
import hr.service.ConfigFileSecondKindService;
import hr.service.HumanFileService;
import hr.service.SalaryGrantDetailsService;
import hr.service.SalaryGrantService;
import hr.service.Salary_standardService;
import hr.util.GetHumanFileId;

@Controller
@RequestMapping("/salaryGrantController")
public class SalaryGrantController {
	@Autowired
	private SalaryGrantService grantService = null;
	@Autowired
	private SalaryGrantDetailsService grantdetailService = null;
	@Autowired
	private HumanFileService humanService = null;
	@Autowired
	private Salary_standardService standardService = null;
	@Autowired
	private ConfigFileSecondKindService secondService = null;
	
	private Salary_grant salaryGrant = new Salary_grant();
	
	@RequestMapping("/paymentList.do")
	public String paymentListSalaryGrant(Model model) {
		Integer count = grantService.querySalaryGrantCount();
		Timestamp lastTime = grantService.querySalaryGrantMaxTime();
		model.addAttribute("lastTime", lastTime);//最后发放时间
		if (count == 0) {
			salaryGrant.setSgr_id(new Integer(0));
			String id = GetHumanFileId.getSalaryGrantIdById(1);
			System.out.println(id);
			salaryGrant.setSalary_grant_id(id);
		}else {
			salaryGrant.setSgr_id(count);
			String id = GetHumanFileId.getSalaryGrantIdById(count);
			salaryGrant.setSalary_grant_id(id);
		}
		//根据二级机构查询出人数
		List<ConfigFileSecondKind> secondList = secondService.queryConfigFileSecondKind();
		List<HumanFile> humanList = humanService.queryHumanFile();
		double total = 0;//总金额
		int num = 0;//总人数
		double secondTotal = 0;//下属机构金额
		int secondNum = 0;//下属机构人数
		//保存数据
		List<Salary_grant> list = new ArrayList<Salary_grant>();
		System.out.println(secondList.size());
		System.out.println(humanList.size());
		
		for (ConfigFileSecondKind configFileSecondKind : secondList) {
			Salary_grant grant = new Salary_grant();
			grant.setFirst_kind_id(configFileSecondKind.getFirst_kind_id());
			grant.setFirst_kind_name(configFileSecondKind.getFirst_kind_name());
			grant.setSecond_kind_id(configFileSecondKind.getSecond_kind_id());
			grant.setSecond_kind_name(configFileSecondKind.getSecond_kind_name());
			for (HumanFile humanFile : humanList) {
				if (humanFile.getCheck_status() == 1){
					total += humanFile.getSalary_sum();
					num += 1;
					if (configFileSecondKind.getFirst_kind_id().equals(humanFile.getFirst_kind_id()) &&
							configFileSecondKind.getSecond_kind_id().equals(humanFile.getSecond_kind_id())) {
						secondTotal += humanFile.getSalary_sum();
						secondNum += 1;
						grant.setHuman_amount(secondNum);
						grant.setSalary_standard_sum(secondTotal);
						System.out.println(humanFile.getSalary_sum()+"=="+secondNum);
					}else {
						grant.setHuman_amount(secondNum);
						grant.setSalary_standard_sum(secondTotal);
					}
				}
			}
			list.add(grant);
			grant = null;
		}
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("num", num);
		model.addAttribute("salaryGrant", salaryGrant);
		
		return "forward:/salary_grant_register_list.jsp";
	}
}
