package hr.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import hr.pojo.ConfigMajor;
import hr.pojo.ConfigMajorKind;
import hr.pojo.Config_primary_key;
import hr.pojo.EngageResume;
import hr.pojo.Engage_major_release;
import hr.service.ConfigMajorKindService;
import hr.service.ConfigMajorService;
import hr.service.ConfigPrimaryKeyService;
import hr.service.Config_public_charService;
import hr.service.EngageResumeService;
import hr.service.Engage_Major_ReleaseService;

@Controller
@RequestMapping("/engageresume")
public class EngageResumeController {
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
	
	@RequestMapping("/apply.do")
	public String apply(String mre_id,Model model,HttpServletRequest request)
	{
		System.out.println("apply.do");

		Engage_major_release engage_major_release = engage_Major_ReleaseService.queryEngageMajorReleaseById(mre_id);
		model.addAttribute("mr", engage_major_release);
		
		model.addAttribute("glist", cpc.queryByAttributeKind("国籍"));
		model.addAttribute("mlist", cpc.queryByAttributeKind("民族"));
		model.addAttribute("zlist", cpc.queryByAttributeKind("宗教信仰"));
		model.addAttribute("zzlist", cpc.queryByAttributeKind("政治面貌"));
		model.addAttribute("xlist", cpc.queryByAttributeKind("学历"));
		model.addAttribute("jlist", cpc.queryByAttributeKind("教育年限"));
		model.addAttribute("xlzylist", cpc.queryByAttributeKind("专业"));
		model.addAttribute("tlist", cpc.queryByAttributeKind("特长"));
		model.addAttribute("alist", cpc.queryByAttributeKind("爱好"));
		
		
		
		return "forward:/resume_register.jsp";
	}
	@RequestMapping("/addResume.do")
	public String addResume(EngageResume engageResume,MultipartFile file,HttpServletRequest request) {
			engageResume.setInterview_status(1);
			//System.out.println(engageResume.getHuman_age());
			String human_picture_name = null;
			try {
				  human_picture_name = "images/resume/" + System.currentTimeMillis()+file.getOriginalFilename();
			      File f = new File(request.getSession().getServletContext().getRealPath("/")+human_picture_name);
			      if(!f.exists()){
			        f.createNewFile();
			      }
			      BufferedOutputStream os = new BufferedOutputStream(new FileOutputStream(f));
			      os.write(file.getBytes());
			      os.flush();
			      os.close();
			    } catch (Exception e) {
			      e.printStackTrace();
			    }
		  
				if(human_picture_name != null)
				{
					engageResume.setHuman_picture("/hr_ssm/" + human_picture_name);
				}
				
				engageResumeService.addEngageResume(engageResume);
				return null;
	}
	
	
	@RequestMapping("/choose.do")
	public String choose(Model model)
	{
		List<ConfigMajorKind> configMajorKinds = configMajorKindService.queryConfigMajorKind();
		
		model.addAttribute("mklist", configMajorKinds);
		return "forward:/resume-choose.jsp";
	}
	
	@RequestMapping("ByIdQueryMajor.do")
	@ResponseBody
	public List<ConfigMajor> byIdQueryMajor(String mid)
	{
		
		return configMajorService.queryConfigMajorByKindId(mid);
	}
	@RequestMapping("/searchByConditions.do")
	public String searchByConditions(String humanmajorkindname,String humanmajorname,String primarkey, Long startdate,Long enddate,Model model)
	{	
		HashMap<String, Object> conditions = new HashMap<String, Object>();

		if(startdate != null) {
			
			Timestamp startDate = new Timestamp(startdate);
			conditions.put("startdate",startDate);
		}
		
		if(enddate != null) {
			Timestamp endDate = new Timestamp(enddate);
			conditions.put("enddate",endDate);
		}
		
		if(humanmajorkindname != null && !"".equals(humanmajorkindname))
		{
			conditions.put("humanmajorkindname",humanmajorkindname);
		}
		
		if(humanmajorname != null && !"".equals(humanmajorname))
		{
			conditions.put("humanmajorname",humanmajorname);
		}
		if(primarkey != null && !"".equals(primarkey))
		{
			conditions.put("primarkey",primarkey);
		}
		
		
		
		List<Config_primary_key> cpks = configPrimaryKeyService.queryConfig_primary_key_byPk("EngageResume");
		conditions.put("cpks", cpks);
				
		List<EngageResume> rlist = engageResumeService.queryEngageResumeByConditions(conditions);
		if(rlist.size() > 0)
		{
			System.out.println(rlist.get(0).getRes_id());
			System.out.println(rlist.get(0).getCheck_status());
			System.out.println("mkn:" + rlist.get(0).getHuman_major_kind_name());
			System.out.println("mn:" + rlist.get(0).getHuman_major_name());
			System.out.println(rlist.get(0).getHuman_name());
			System.out.println(rlist.get(0).getRegist_time());
			System.out.println(rlist.get(0).getHuman_mobilephone());
			System.out.println(rlist.get(0).getHuman_idcard());
		}
		
		model.addAttribute("resultList", rlist);
		return "forward:/resume-list.jsp";
		//return null;
	}
	
	/**
	 * 准备复核
	 * @return
	 */
	@RequestMapping("/initCheck.do")
	public String initCheck(int resid,Model model) {
		EngageResume mr = engageResumeService.queryEngageResumeById(resid);
		model.addAttribute("re", mr);
		return "forward:/resume-details.jsp";
	}
	/**
	 * 复核
	 */
	@RequestMapping("check.do")
	public String check(EngageResume engageResume,Model model) {
		engageResume.setCheck_status("1");
		
		engageResumeService.modifyEngageResumeById(engageResume);
		
		return "forward:/engageresume/validlist.do";
	}
	@RequestMapping("/validlist.do")
	public String validList(Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("checkstatus","1");
		
		List<EngageResume> res = engageResumeService.queryEngageResumeByConditions(map);
		
		model.addAttribute("resultList", res);
		
		return "forward:/resum-valid-list.jsp";
	}
	
	@RequestMapping("/validResumeById.do")
	public String validResumeById(int resid,Model model)
	{
		EngageResume en = engageResumeService.queryEngageResumeById(resid);
		
		model.addAttribute("re", en);
		return "forward:/resume-select.jsp";
	}
}
