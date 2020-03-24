package hr.web.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hr.pojo.ConfigFileFirstKind;
import hr.pojo.ConfigFileSecondKind;
import hr.pojo.ConfigFileThirdKind;
import hr.pojo.ConfigMajor;
import hr.pojo.ConfigMajorKind;
import hr.pojo.Config_primary_key;
import hr.pojo.HumanFile;
import hr.pojo.HumanFileDig;
import hr.service.ConfigFileFirstKindService;
import hr.service.ConfigFileSecondKindService;
import hr.service.ConfigFileThirdKindService;
import hr.service.ConfigMajorKindService;
import hr.service.ConfigMajorService;
import hr.service.ConfigPrimaryKeyService;
import hr.service.Config_public_charService;
import hr.service.HumanFileDigService;
import hr.service.HumanFileService;

@Controller
@RequestMapping("/deleteLocateContorller")
public class DeleteLocateContorller {
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
		
		//做恢复操作,则查询状态为1的
		if ("modify".equals(query)) {
			map.put("human_file_status", 1);
		}
		map.put("first_kind_id", humanFile.getFirst_kind_id());
		map.put("second_kind_id", humanFile.getSecond_kind_id());
		map.put("third_kind_id", humanFile.getThird_kind_id());
		map.put("human_major_kind_id", humanFile.getHuman_major_kind_id());
		map.put("human_major_id", humanFile.getHuman_major_id());
		map.put("starttime", humanFile.getRegist_time());
		map.put("endtime", humanFile.getLastly_change_time());
		
		//关键字
		List<Config_primary_key> prmlist = primarykeyservice.queryConfig_primary_key_byPk("HumanFile");
		map.put("prmlist", prmlist);
		
		List<HumanFile> list = service.queryHumanFileCondition(map);
		//系统管理员、待复核不能删除
		Iterator<HumanFile> it = list.iterator();
		if ("delete".equals(query)) {
			while(it.hasNext()) {
				HumanFile human = it.next();
				if (human.getCheck_status() == 0 || human.getHuman_file_status() == 1) {
					it.remove();
				}
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("max", list.size());
		if ("delete".equals(query)) {
			return "forward:/delete_list.jsp";
		}else if ("modify".equals(query)) {
			return "forward:/recovery_list.jsp";
		}
		
		return "redirect:/left.jsp";
	}
	
	@RequestMapping("/modify.do")
	public String modifyHuman(@RequestParam("huf_id") int huf_id,String caozuo) {
		HumanFile humanfile = new HumanFile();
		humanfile.setHuf_id(huf_id);
		HumanFileDig humanfiledig = Digservice.queryHumanFileDigById(huf_id);
		Timestamp time = new Timestamp(new Date().getTime());
		if ("delete".equals(caozuo)) {
			humanfile.setHuman_file_status(1);
			humanfiledig.setHuman_file_status(1);
			humanfile.setDelete_time(time);
			humanfiledig.setDelete_time(time);
		}
		if("modify".equals(caozuo)){
			humanfile.setHuman_file_status(0);
			humanfiledig.setHuman_file_status(0);
		}
		boolean falg = service.modifyHumanFileStatus(humanfile);
		boolean digfalg = Digservice.modifyHumanFileDigById(humanfiledig);
		
		if (digfalg && falg) {
			if ("delete".equals(caozuo)) {
				return "redirect:/delete_humanfile_success.jsp";
			}
			if ("modify".equals(caozuo)) {
				return "redirect:/recovery_humanfile_success.jsp";
			}
		}
		
		return null;
	}
	
	@RequestMapping("/queryAll.do")
	public String queryAllHumanFile(Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("human_file_status", 1);
		List<HumanFile> list = service.queryHumanFileCondition(map);
		model.addAttribute("list", list);
		model.addAttribute("max", list.size());
		
		return "forward:/delete_forever_list.jsp";
	}
	
	@RequestMapping("/delete.do")
	public String deleteHumanFile(@RequestParam("huf_id") int huf_id) {
		boolean falg = service.removeHumanFileById(huf_id);
		if (falg) {
			return "redirect:/recovery_humanfile_success.jsp";
		}
		
		return null;
	}
}
