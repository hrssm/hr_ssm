package hr.web.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
import hr.pojo.Config_public_char;
import hr.pojo.HumanFile;
import hr.pojo.HumanFileDig;
import hr.pojo.Salary_standard;
import hr.service.ConfigFileFirstKindService;
import hr.service.ConfigFileSecondKindService;
import hr.service.ConfigFileThirdKindService;
import hr.service.ConfigMajorKindService;
import hr.service.ConfigMajorService;
import hr.service.Config_public_charService;
import hr.service.HumanFileDigService;
import hr.service.HumanFileService;
import hr.service.Salary_standardService;
import hr.util.ExcleHumanfile;
import hr.util.GetHumanFileId;

@Controller
@RequestMapping("/humanFile")
public class HumanFileController {
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
	private Salary_standardService salaryService = null;
	
	private HumanFile humanfile = null;
	private HumanFileDig humanfiledig = null;
	private HumanFile human = null;
	private List<Config_public_char> publicList = null;
	
	@RequestMapping("/register.do")
	public String registerHumanFile(Model model) {
		if (publicList == null) {
			publicList = PublicCharService.queryConfig_public_char();
		}
		model.addAttribute("publicList", publicList);
		Date date = new Date();
		Timestamp time = new Timestamp(date.getTime());
		model.addAttribute("time", time);
		int count = service.queryHumanFileCount();
		count++;
		String hufid = GetHumanFileId.getHumanFileIdById(count);
		model.addAttribute("hufid", hufid);
		model.addAttribute("count", count);
		List<Salary_standard> salaryList = salaryService.querySalary_standard();
		model.addAttribute("salaryList", salaryList);
		
		return "forward:/human_register.jsp";
	}
	
	@RequestMapping("/add.do")
	public String addHumanFile(@ModelAttribute HumanFile humanFile,@ModelAttribute HumanFileDig humanFileDig) {
		humanfile = humanFile;
		humanfiledig = humanFileDig;
		humanfile.setCheck_status(0);
		humanfiledig.setCheck_status(0);
		humanfile.setHuman_file_status(0);
		humanfiledig.setHuman_file_status(0);
		
		return "redirect:/register_choose_picture.jsp";
	}
	
	@RequestMapping("/save.do")
	public String saveHumanFile() {
		boolean falg = service.saveHumanFile(humanfile);
		boolean digfalg = Digservice.saveHumanFileDig(humanfiledig);
		if (digfalg && falg) {
			return "redirect:/human_register_success.jsp";
		}
		return "redirect:/register_choose_picture.jsp";
	}
	
	@RequestMapping("/init.do")
	@ResponseBody
	public Map<String, Object> initHumanFile() {
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
	
	@RequestMapping("/queryAll.do")
	public String queryAllHumanFile(Model model) {
		List<HumanFile> list = service.queryHumanFile();
		List<HumanFile>	checklist = new ArrayList<HumanFile>();
		for (HumanFile humanFile : list) {
			//未审核或未删除
			if (humanFile.getCheck_status() == 0) {
				checklist.add(humanFile);
			}
		}
		model.addAttribute("checklist", checklist);
		model.addAttribute("max", checklist.size());
		
		return "forward:/check_list.jsp";
	}
	
	@RequestMapping("/queryOne.do")
	public String queryOneHumanFile(@RequestParam("huf_id") int huf_id ,Model model) {
		human = service.queryHumanFileById(huf_id);
		if (publicList == null) {
			publicList = PublicCharService.queryConfig_public_char();
		}
		model.addAttribute("publicList", publicList);
		if (human == null) {
			return "redirect:/check_list.jsp";
		}
		model.addAttribute("human", human);
		model.addAttribute("publicList", publicList);
		Date date = new Date();
		Timestamp time = new Timestamp(date.getTime());
		model.addAttribute("check_time", time);
		List<Salary_standard> salaryList = salaryService.querySalary_standard();
		model.addAttribute("salaryList", salaryList);
		
		return "forward:/human_check.jsp";
	}
	
	@RequestMapping("/checkSelect.do")
	@ResponseBody
	public HumanFile checkSelect() {
		System.out.println(this.human.getHuman_pro_designation());
		return this.human;
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
		
		humanFile.setCheck_status(1);
		humanFileDig.setCheck_status(1);
		boolean falg = service.modifyHumanFileById(humanFile);
		boolean digfalg = Digservice.modifyHumanFileDigById(humanFileDig);
		
		if (digfalg && falg) {
			return "redirect:/human_check_success.jsp";
		}
		return null;
	}
	
	@RequestMapping("/picture.do")
	public String savePicture(MultipartFile picture,HttpServletRequest request) {
		String human_picture = null;
		human_picture = "images/humanfileimages/"+System.currentTimeMillis()+picture.getOriginalFilename();
		File file = new File(request.getSession().getServletContext().getRealPath("/")+human_picture);
		try {
			if (!file.exists()) {
				file.createNewFile();
			}
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
			bos.write(picture.getBytes());
			bos.flush();
			bos.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (human_picture != null) {
			humanfile.setHuman_picture("/hr_ssm/"+human_picture);
		}
		
		return "redirect:/register_choose_attachment.jsp";
	}
	@RequestMapping("/attachment.do")
	public String save(MultipartFile attachment,HttpServletRequest request) {
		String attachment_name = null;
		attachment_name = "images/humanfileimages/"+System.currentTimeMillis()+attachment.getOriginalFilename();
		File file = new File(request.getSession().getServletContext().getRealPath("/")+attachment_name);
		try {
			if (!file.exists()) {
				file.createNewFile();
			}
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(file));
			bos.write(attachment.getBytes());
			bos.flush();
			bos.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (attachment_name != null) {
			humanfile.setAttachment_name(attachment_name);
		}
		
		return "redirect:/register_choose_picture.jsp";
	}
	
	//Excel标准数据报表
	@RequestMapping("/excel.do")
	public String getHumanFileExcel(@ModelAttribute HumanFile humanFile,
			HttpServletRequest request,HttpServletResponse response,Model model) {
		List<HumanFile> list = service.queryHumanFile();
		
		String path = ExcleHumanfile.export(request, response, list, humanFile);
		System.out.println(path);
		model.addAttribute("path", path);
		return "forward:/excel_success.jsp";
	}
	
	@RequestMapping("/exportfile.do")
	public void exportfile(String path,HttpServletRequest request,HttpServletResponse response) {
		File file = new File(path);
		response.setContentType("application/binary;charset=UTF-8");
		try {
			response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode("人力资源档案.xlsx", "UTF-8"));
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			OutputStream out = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(out);
			byte[] b = new byte[1024];
			int len = -1;
			while((len = bis.read(b)) != -1) {
				bos.write(b);
				bos.flush();
			}
			bos.close();
			bis.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
