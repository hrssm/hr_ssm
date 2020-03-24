package hr.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hr.pojo.ConfigFileFirstKind;
import hr.pojo.ConfigFileSecondKind;
import hr.pojo.ConfigFileThirdKind;
import hr.pojo.ConfigMajor;
import hr.pojo.ConfigMajorKind;
import hr.pojo.Engage_major_release;
import hr.service.ConfigFileFirstKindService;
import hr.service.ConfigFileSecondKindService;
import hr.service.ConfigFileThirdKindService;
import hr.service.ConfigMajorKindService;
import hr.service.ConfigMajorService;
import hr.service.Engage_Major_ReleaseService;

@Controller
@RequestMapping("/engagemajorrelease")
public class EngageMajorReleaseController {
	
	@Autowired
	private Engage_Major_ReleaseService engageMajorReleaseService;
	@Autowired
	private ConfigFileThirdKindService configFileThirdKindService;
	@Autowired
	private ConfigFileSecondKindService configFileSecondKindService;
	@Autowired
	private ConfigFileFirstKindService configFileFirstKindService;
	@Autowired
	private ConfigMajorService configMajorService;
	@Autowired
	private ConfigMajorKindService configMajorKindService;
	
	@RequestMapping("/initAdd.do")
	@ResponseBody
	public HashMap<String,Object> initAdd(){
		HashMap<String,Object> map = new HashMap<String,Object>();		
		
		List<ConfigFileFirstKind> configFileFirstKinds = configFileFirstKindService.queryConfigFileFirstKind();
		map.put("configFileFirstKinds", configFileFirstKinds);
		map.put("f_total", configFileFirstKinds.size());
		
		
		List<ConfigFileSecondKind> configFileSecondKinds = configFileSecondKindService.queryConfigFileSecondKind();
		map.put("configFileSecondKinds", configFileSecondKinds);
		map.put("s_total", configFileSecondKinds.size());
		
		
		List<ConfigFileThirdKind> configFileThirdKinds = configFileThirdKindService.queryConfigFileThirdKind();
		map.put("configFileThirdKinds", configFileThirdKinds);
		map.put("f_total", configFileThirdKinds.size());
		
		
		List<ConfigMajor> configMajors = configMajorService.queryConfigMajor();
		map.put("configMajors", configMajors);
		map.put("cm_total", configMajors.size());
		
		List<ConfigMajorKind> configMajorKinds =  configMajorKindService.queryConfigMajorKind();
		map.put("configMajorKinds", configMajorKinds);
		map.put("cmk_total", configMajorKinds.size());
		
		
		return map;
	}
	
	
	@RequestMapping("/add.do")
	public String add(Engage_major_release engage_major_release) {
		engageMajorReleaseService.addEngageMajorRelease(engage_major_release);
		return "forward:/engagemajorrelease/queryAll.do";
	}
	
	@RequestMapping("/queryAll.do")
	public String queryAll(Model model)
	{
		List<Engage_major_release> list = engageMajorReleaseService.queryEngageMajorReleaseAll();
		model.addAttribute("mrlist", list);
		return "forward:/position_release_search.jsp";
	}
	
	@RequestMapping("/showDetail.do")
	public String showDetail(String mre_id,Model model)
	{
		System.out.println("showDetail.do");
		Engage_major_release mr = engageMajorReleaseService.queryEngageMajorReleaseById(mre_id);
		model.addAttribute("mr", mr);
		
		return "forward:/position_release_details.jsp";
	}
	
	
	@RequestMapping("/initEdit.do")
	public String initEdit(Model model)
	{
		List<Engage_major_release> list = engageMajorReleaseService.queryEngageMajorReleaseAll();
		model.addAttribute("mrlist", list);
		return "forward:/position_change_update.jsp";
	}
	
	@RequestMapping("/Edit.do")
	public String edit(String mre_id,Model model)
	{
		System.out.println("Edit");
		Engage_major_release mr = engageMajorReleaseService.queryEngageMajorReleaseById(mre_id);
		model.addAttribute("mr", mr);
		return "forward:/position_release_change.jsp";
	}
	
	@RequestMapping("/modify.do")
	public String modefy(Engage_major_release engage_major_release)
	{
		engageMajorReleaseService.modifyEngageMajorRelease(engage_major_release);
		return "redirect:/engagemajorrelease/initEdit.do";
	}
	
	@RequestMapping("/deleteMajorRelease.do")
	@ResponseBody
	public String deleteMajorRelease(String mid)
	{
		engageMajorReleaseService.removeEngageMajorReleaseById(mid);
		return "ok";
	}
	
	@RequestMapping("/getMajorRelease.do")
	@ResponseBody
	public HashMap<String,List<Engage_major_release>> getMajorRelease(){
		List<Engage_major_release> list = engageMajorReleaseService.queryEngageMajorReleaseGroupById();
		HashMap<String,List<Engage_major_release>> map = new HashMap<String,List<Engage_major_release>>();
		map.put("major_release", list);
		return map;
	}
}
