package hr.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hr.pojo.EngageInterview;
import hr.pojo.EngageResume;
import hr.service.ConfigMajorKindService;
import hr.service.ConfigMajorService;
import hr.service.ConfigPrimaryKeyService;
import hr.service.Config_public_charService;
import hr.service.EngageInterviewService;
import hr.service.EngageResumeService;
import hr.service.Engage_Major_ReleaseService;

@Controller
@RequestMapping("/engageinterview")
public class EngageInterviewController {
	@Autowired
	private EngageResumeService engageResumeService;
	@Autowired
	private Engage_Major_ReleaseService engage_Major_ReleaseService;
	@Autowired
	private Config_public_charService cpc;
	@Autowired
	private ConfigMajorService configMajorService;
	@Autowired
	private ConfigMajorKindService configMajorKindService;
	@Autowired
	private ConfigPrimaryKeyService configPrimaryKeyService;
	@Autowired
	private EngageInterviewService engageInterviewService;
	
	@RequestMapping("/initList.do")
	public String initList(Model model) {

		List<EngageResume> resultList = engageResumeService.queryAllEngageResume();
		
		model.addAttribute("resultList", resultList);
		return "forward:/interview-list.jsp";
	}
	
	@RequestMapping("/initAdd.do")
	public String initAdd(int resId,Model model) {
		
		EngageResume re = engageResumeService.queryEngageResumeById(resId);
		
		model.addAttribute("re", re);
		
		return "forward:/interview-register.jsp";
	}
	
	@RequestMapping("/addInterviewOne.do")
	public String addInterviewOne(EngageInterview engageInterview,Model model) {
		
		engageInterviewService.addEngageInterview(engageInterview);
		
		List<EngageInterview> vlist = engageInterviewService.queryAllEngageInterview();
		
		model.addAttribute("vlist", vlist);
		
		return "forward:/interview-sift-list.jsp";
	}
	
	@RequestMapping("/queryAll.do")
	public String queryAll(Model model) {
		
		List<EngageInterview> vlist = engageInterviewService.queryAllEngageInterview();
		model.addAttribute("vlist", vlist);
		
		return "forward:/interview-sift-list.jsp";
	}
	
	@RequestMapping("/sift.do")
	public String sift(int ein_id,Model model) {
		EngageInterview vi = engageInterviewService.queryEngageInterviewById(ein_id);
		
		EngageResume re = engageResumeService.queryEngageResumeById(vi.getResume_id());
		
		model.addAttribute("vi", vi);
		model.addAttribute("re", re);
		return "forward:/interview-sift.jsp";
	}
	
	@RequestMapping("/updateSift.do")
	public String updateSift(EngageInterview engageInterview,Model model)
	{
		if("删除简历".equals(engageInterview.getCheck_comment()))
		{
			engageResumeService.removeEngageResumeById(engageInterview.getResume_id());
			engageInterviewService.removeEngageInterviewById(engageInterview.getEin_id());
		}else {
			engageInterviewService.modifyEngageInterviewById(engageInterview);
		}
		
		List<EngageInterview> vlist = engageInterviewService.queryAllEngageInterview();
		model.addAttribute("vlist", vlist);
		
		return "forward:/interview-sift-list.jsp";
	}
}
