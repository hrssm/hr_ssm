package hr.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import hr.pojo.ConfigFileFirstKind;
import hr.pojo.ConfigFileSecondKind;
import hr.pojo.ConfigFileThirdKind;
import hr.pojo.ConfigMajor;
import hr.pojo.ConfigMajorKind;
import hr.pojo.Config_primary_key;
import hr.pojo.Config_public_char;
import hr.pojo.HumanFile;
import hr.pojo.HumanFileDig;
import hr.pojo.Salary_standard;
import hr.service.ConfigFileFirstKindService;
import hr.service.ConfigFileSecondKindService;
import hr.service.ConfigFileThirdKindService;
import hr.service.ConfigMajorKindService;
import hr.service.ConfigMajorService;
import hr.service.ConfigPrimaryKeyService;
import hr.service.Config_public_charService;
import hr.service.HumanFileDigService;
import hr.service.HumanFileService;
import hr.service.Salary_standardService;

@Controller
@RequestMapping("/queryLocateController")
public class QueryLocateController {
	@Autowired
	private HumanFileService service = null;
	@Autowired
	private HumanFileDigService Digservice = null;
	@Autowired
	private ConfigFileFirstKindService FirstService = null;
	@Autowired
	private ConfigFileSecondKindService SecondService = null;
	@Autowired
	private ConfigFileThirdKindService ThirdService = null;
	@Autowired
	private ConfigMajorKindService MajorKindService = null;
	@Autowired
	private ConfigMajorService MajorService = null;
	@Autowired
	private Config_public_charService PublicCharService = null;
	@Autowired
	private ConfigPrimaryKeyService primarykeyservice = null;
	@Autowired
	private Salary_standardService salaryService = null;
	
	private HumanFile human = null;
	
	@RequestMapping("/init.do")
	@ResponseBody
	public Map<String, Object> initQueryLocate() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ConfigFileFirstKind> firstlist = FirstService.queryConfigFileFirstKind();
		map.put("firstlist", firstlist);
		map.put("first_total", firstlist.size());
		
		List<ConfigFileSecondKind> secondlist = SecondService.queryConfigFileSecondKind();
		map.put("secondlist", secondlist);
		map.put("second_total", secondlist.size());
		
		List<ConfigFileThirdKind> thirdlist = ThirdService.queryConfigFileThirdKind();
		map.put("thirdlist", thirdlist);
		map.put("third_total", thirdlist.size());
		
		List<ConfigMajorKind> majorkindlist = MajorKindService.queryConfigMajorKind();
		map.put("majorkindlist", majorkindlist);
		map.put("majorkind_total", majorkindlist.size());
		
		List<ConfigMajor> majorlist = MajorService.queryConfigMajor();
		map.put("majorlist", majorlist);
		map.put("major_total", majorlist.size());
		return map;
	}
	
	@RequestMapping("/queryList.do")
	public String queryListHumanFile(@ModelAttribute HumanFile humanFile,String primarykey,Model model,
			@RequestParam("query") String query) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (primarykey != null && !"".equals(primarykey)) {
			map.put("primarykey", primarykey);
		}
		
		map.put("first_kind_id", humanFile.getFirst_kind_id());
		map.put("second_kind_id", humanFile.getSecond_kind_id());
		map.put("third_kind_id", humanFile.getThird_kind_id());
		map.put("human_major_kind_id", humanFile.getHuman_major_kind_id());
		map.put("human_major_id", humanFile.getHuman_major_id());
//		map.put("human_file_status", humanFile.isHuman_file_status());
		map.put("starttime", humanFile.getRegist_time());
		map.put("endtime", humanFile.getLastly_change_time());
		List<Config_primary_key> prmlist = primarykeyservice.queryConfig_primary_key_byPk("HumanFile");
		map.put("prmlist", prmlist);
		
		
		List<HumanFile> list = service.queryHumanFileCondition(map);
		model.addAttribute("list", list);
		model.addAttribute("max", list.size());
		if ("select".equals(query)) {
			return "forward:/query_list.jsp";
		}else if ("change".equals(query)) {
			return "forward:/change_list.jsp";
		}
		
		return "forward:/query_list.jsp";
	}
	
	@RequestMapping("/queryone.do")
	public String queryOneListHumanFile(@RequestParam("huf_id") int huf_id,String caozuo,Model model) {
		if (this.human == null) {
			this.human = service.queryHumanFileById(huf_id);
		}
		List<Config_public_char> publicList = PublicCharService.queryConfig_public_char();
		model.addAttribute("human", this.human);
		model.addAttribute("publicList", publicList);
		List<Salary_standard> salaryList = salaryService.querySalary_standard();
		model.addAttribute("salaryList", salaryList);
		Date date = new Date();
		Timestamp time = new Timestamp(date.getTime());
		model.addAttribute("change_time", time);
		if ("query".equals(caozuo)) {
			return "forward:/query_Detailed.jsp";
		}else if ("change".equals(caozuo)) {
			return "forward:/change_check.jsp";
		}
		
		return "forward:/query_Detailed.jsp";
	}
	
	@RequestMapping("/modify.do")
	public String modifyHumanFile(@ModelAttribute HumanFile humanFile,@ModelAttribute HumanFileDig humanFileDig,
			MultipartFile humanpicture,HttpServletRequest request) {
		String human_picture = null;
		human_picture = "images/humanfileimages/"+System.currentTimeMillis()+humanpicture.getOriginalFilename();
		File file = new File(request.getSession().getServletContext().getRealPath("/")+human_picture);
		try {
			if (!file.exists()) {
				file.createNewFile();
			}
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
			bos.write(humanpicture.getBytes());
			bos.flush();
			bos.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (human_picture != null) {
			humanFile.setHuman_picture("/hr_ssm/"+human_picture);
			humanFileDig.setHuman_picture("/hr_ssm/"+human_picture);
		}
		
		humanFile.setCheck_status(0);
		humanFileDig.setCheck_status(0);
		boolean falg = service.modifyHumanFileById(humanFile);
		boolean digfalg = Digservice.modifyHumanFileDigById(humanFileDig);
		
		if (digfalg && falg) {
			return "redirect:/change_check_success.jsp";
		}
		return null;
	}
	
	@RequestMapping("/checkSelect.do")
	@ResponseBody
	public HumanFile checkSelect() {
		return this.human;
	}
}
