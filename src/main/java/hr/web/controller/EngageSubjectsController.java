package hr.web.controller;

import java.util.Date;

import static org.springframework.test.web.client.response.MockRestResponseCreators.withCreatedEntity;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameter;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.fasterxml.jackson.databind.util.JSONWrappedObject;

import hr.dto.Food;
import hr.dto.SetQuestionInfo;
import hr.dto.TestPaperInfo;
import hr.pojo.ConfigQuestionSecondKind;
import hr.pojo.EngageSubjects;
import hr.service.EngageSubjectsService;
import hr.service.impl.EngageSubjectsServiceImpl;
import hr.util.IdMap;
import hr.util.MyRandom;

@Controller
@RequestMapping("/engageSubjectsController")
public class EngageSubjectsController {
	@Autowired
	private ConfigQuestionSecondKindController cqfkController = null;
	
	@Autowired
	private EngageSubjectsService engageSubjectsService = null;
	
	@RequestMapping(value="/getFirstAndSecondMap.do" , method=RequestMethod.POST)
	@ResponseBody
	public Map getFirstAndSecondMap() {
		//System.out.println("进入engageSubjectsController");
		Map map = new HashMap<>();
		//Map<String,List> listFirstMap = new HashMap<String,List>();
		//Map<String,List> listSecondMap = new HashMap<String,List>();
		Map<String,String[]> fsidMap = new HashMap<String,String[]>();
		
		String idstr = "";
		String namestr = "";
		List<ConfigQuestionSecondKind> list = cqfkController.linkageSelect();
		/*listFirstMap.put("listFirstMap",list);*/
		//System.out.println(list);
		for (ConfigQuestionSecondKind c : list) {
			int i = 1;
			if( c.getSecond_kind_id() != null) {
				
				//fsidMap.put(c.getFirst_kind_id(), c.getSecond_kind_id().split(","));
			 	idstr+=c.getSecond_kind_id()+",";
				namestr+=c.getSecond_kind_name()+",";
			}
		}
		
		String[] idarr = idstr.split(",");
		String[] namearr = namestr.split(",");
		
		List<ConfigQuestionSecondKind> listSecond = new ArrayList<ConfigQuestionSecondKind>();
		
		for (int i = 0; i < namearr.length; i++) {
			ConfigQuestionSecondKind secondObject = new ConfigQuestionSecondKind();
			secondObject.setSecond_kind_id(idarr[i]);
			secondObject.setSecond_kind_name(namearr[i]);
			listSecond.add(secondObject);
		}
		//listSecondMap.put("listSecondMap", listSecond);
		map.put("listFirstMap", list);
		map.put("listSecondMap", listSecond);
		//map.put("fsidMap", fsidMap);
	
		return map;
	}

@RequestMapping("/save.do")
public String saveSbject(@ModelAttribute EngageSubjects engageSubjects) {
	int max = 0;
	if(IdMap.IDMAP.get("sub_id")==null) {
		max = engageSubjectsService.queryMaxId();
	}else {
		max = IdMap.IDMAP.get("sub_id");
	}
	IdMap.IDMAP.put("sub_id", max+1);
	Date date = new Date();//获取当前日期
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//格式化 格式必须是yyyy-mm-dd hh:mm:ss
	String currentdate = sdf.format(date);//将时间格式化
	Timestamp s= Timestamp.valueOf(currentdate);//将String类型的事件格式转换成Timestamp格式
	engageSubjects.setSub_id(max+1);
	engageSubjects.setRegist_time(s.toString());
	engageSubjects.setChange_time(s.toString());
	engageSubjects.setFirst_kind_id(engageSubjects.getFirst_kind_id().replaceAll(",", ""));
	engageSubjects.setFirst_kind_name(engageSubjects.getFirst_kind_name().replaceAll(",", ""));
	engageSubjects.setSecond_kind_id(engageSubjects.getSecond_kind_id().replaceAll(",", ""));
	engageSubjects.setSecond_kind_name(engageSubjects.getSecond_kind_name().replaceAll(",", ""));
	boolean flag = engageSubjectsService.addEngageSubjects(engageSubjects);
	if(flag) {
		return "redirect:/question_subjects_regist_success.jsp";
	}else {
		return "forward:/question_subjects_regist.jsp";
	}
}

@RequestMapping(value="/query.do",method=RequestMethod.POST)
@ResponseBody
public List<EngageSubjects> queryEngageSubjectsByCondition(@RequestParam("first_kind_id") String first_kind_id,@RequestParam("second_kind_id") String second_kind_id,@RequestParam("derivation") String derivation,@RequestParam("register") String register,@RequestParam("changer") String changer,@RequestParam("startTime") String startTime,@RequestParam("endTime") String endTime){
	try {
		first_kind_id= URLDecoder.decode(first_kind_id, "UTF-8");
		second_kind_id = URLDecoder.decode(second_kind_id,"UTF-8");
		derivation = URLDecoder.decode(derivation,"UTF-8");
		register = URLDecoder.decode(register,"UTF-8");
		changer = URLDecoder.decode(changer,"UTF-8");
		startTime = URLDecoder.decode(startTime,"UTF-8");
		endTime = URLDecoder.decode(endTime,"UTF-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	HashMap<String,Object> map = new HashMap<String,Object>();
	map.put("first_kind_id", first_kind_id);
	map.put("second_kind_id", second_kind_id);
	map.put("derivation", derivation);
	map.put("register", register);
	map.put("changer", changer);
	map.put("startTime",startTime);
	map.put("endTime",endTime);
	/*System.out.println("------------------进入controller----------------------");
	System.out.println("engageSubjects======"+first_kind_id+"::"+second_kind_id+"::"+derivation+"::"+register+"::"+changer);*/
	/*System.out.println(startTime+"----"+endTime);*/
	return engageSubjectsService.queryEngageSubjectsByCondition(map);
	}

@RequestMapping(value="/change.do",method=RequestMethod.POST)
@ResponseBody
public boolean changeSubject(@ModelAttribute EngageSubjects engageSubjects,@RequestParam("subject_id") String subject_id) {
	/*System.out.println(engageSubjects.getSub_id());*/
	if(subject_id != null && subject_id != "") {
		engageSubjects.setSub_id(Integer.valueOf(subject_id));
	//System.out.println(subject_id);
	}
	/*System.out.println(engageSubjects.getFirst_kind_id()+"===="+engageSubjects.getSecond_kind_id());
	System.out.println(engageSubjects.getFirst_kind_name()+"===="+engageSubjects.getSecond_kind_name());
	System.out.println(engageSubjects.getContent()+"===="+engageSubjects.getDerivation());
	System.out.println(engageSubjects.getCorrect_key());
	System.out.println(engageSubjects.getKey_a()+"===="+engageSubjects.getKey_b());
	System.out.println(engageSubjects.getKey_c()+"===="+engageSubjects.getKey_d());
	System.out.println(engageSubjects.getKey_e());*/
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	engageSubjects.setChange_time(sdf.format(date));
	boolean flag = engageSubjectsService.modifyEngageSubjects(engageSubjects);
	return flag;
}

@RequestMapping("/selectSubjectGroup.do")
@ResponseBody
public HashMap<String,List<EngageSubjects>> selectSubjectGroup() {
	HashMap<String,List<EngageSubjects>> hashmap = new HashMap<String,List<EngageSubjects>>();
	List<EngageSubjects> list = engageSubjectsService.selectSubjectGroup();
	/*String[] listArr= {""};
	for (EngageSubjects engageSubjects : list) {
		listArr = engageSubjects.getSecond_kind_name().split(",");
		for (int i = 0; i < listArr.length; i++) {
			
		}
	}*/
	hashmap.put("allSubject", list);
	return hashmap;
}

@RequestMapping(value="/setQuestion.do",method=RequestMethod.POST)
@ResponseBody
public Map<String,List<EngageSubjects>> setQuestion(@RequestBody JSONObject obj){
	
  String data = obj.toJSONString();
  JSONObject json = JSON.parseObject(data);
  
  String questionInfo=json.getString("questionInfo");
  String testPaperInfo=json.getString("testPaperInfo");
  
  List<String> answerList = new ArrayList<String>();
  Map<String,List<EngageSubjects>> mapSubject = new HashMap<String,List<EngageSubjects>>();
  List<SetQuestionInfo> questionlist = JSONArray.parseArray(questionInfo, SetQuestionInfo.class);
  List<TestPaperInfo> testlist = JSONArray.parseArray(testPaperInfo, TestPaperInfo.class);
  //--------循环需要的套卷数量------------------------
  int amount = Integer.valueOf(testlist.get(0).getTestPaperCount());
  for(int i=0;i<amount;i++) {
  //-----------出题所有信息------------------------------------
		List<EngageSubjects> subjectList = new ArrayList<EngageSubjects>();
  for (SetQuestionInfo qlist : questionlist) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("first_kind_name", qlist.getFirst_question_kind_name());
		map.put("second_kind_name", qlist.getSecond_question_kind_name());
		List<EngageSubjects> list = engageSubjectsService.queryEngageSubjectsByCondition(map);
		
		List<Integer> indexList = MyRandom.getRandomIndex(list.size(), Integer.valueOf(qlist.getQuestion_amount()));
		
		//System.out.println(indexList.toString());
		//-------------具体哪一题(随机出题)-----------------
		for (Integer index : indexList) {
			subjectList.add(list.get(index));
		  /* answerList.add(list.get(index).getCorrect_key());*/
		}
	}
  //---------为一套题设置编号并存入mapSubject中--------------------
	  if(IdMap.testNumberMap.get("testId") == null) {
			IdMap.testNumberMap.put("testId",0);
			mapSubject.put("A00000"+String.valueOf(0), subjectList);
			
		}else {
			int number = IdMap.testNumberMap.get("testId");
			/*System.out.println(number);*/
			mapSubject.put("A00000"+String.valueOf(number+1), subjectList);
			IdMap.testNumberMap.put("testId",IdMap.testNumberMap.get("testId")+1);
		}
	//---------将试卷基本信息存入 以及试题信息存入IdMap.------------
  
  IdMap.testPaperMap.put(testlist.get(0), mapSubject);
	
  }
  //--------------遍历 IdMap.testPaperMap校验数据----------------
	/*for(Entry<Object, Map> entry : IdMap.testPaperMap.entrySet()) {
		TestPaperInfo info = (TestPaperInfo)entry.getKey();
		System.out.println("TestPaperInfo--"+info.getMajor_kind_name()+"--"+info.getMajor_name()+"--"+info.getTimeLimit());
		
		Map<String,List<EngageSubjects>> mapSub = entry.getValue();
		
		for(Map.Entry<String,List<EngageSubjects>> en : mapSub.entrySet()) {
			System.out.println("-----------"+en.getKey()+"------------------");
			List<EngageSubjects> list = en.getValue();
			for (EngageSubjects e : list) {
				System.out.println(e.getFirst_kind_name()+"--"+e.getSecond_kind_name()+"--"+e.getCorrect_key());
			}
		}*/
	
	/*	System.out.println(mapSub);
		System.out.println("*************************************************");*/
	//}
		
  /*for (TestPaperInfo food : testlist) {
		System.out.println(food.getMajor_kind_name()+"=="+food.getMajor_name()+"=="+food.getTimeLimit());
		
	}*/
	return IdMap.testPaperMap.get(testlist.get(0));
	}


@RequestMapping(value="/getExamPaper.do",method=RequestMethod.POST)
@ResponseBody
public Map<String, Map> getExamPaper(@RequestParam("position_kind_name") String pkname,@RequestParam("position_name") String pname,@RequestParam("name") String name,@RequestParam("IdCard") String IdCard){
	System.out.println("--------------------进入getExamPaper.do---------------------");
	//得到所有的试卷 map<编号string，试题list>
	Map<Object,Map> allPaperMap = IdMap.testPaperMap;
	//遍历allPaperMap找出对应的套题===>testPaperList
	Set<Object> keySet = allPaperMap.keySet();
	List listSubjects = new ArrayList();
	//List<String> listPaperInfo =  new ArrayList<String>();
	String limitTime = "";
	for (Object object : keySet) {
		TestPaperInfo info = (TestPaperInfo)object;
		if(info.getMajor_kind_name().equals(pkname) && info.getMajor_name().equals(pname)) {
			limitTime = info.getTimeLimit();
			//listPaperInfo.add(limitTime);
			/*List list = allPaperMap.get(object);*/
		/*	allPaperMap.get(object).size();
			Map map = allPaperMap.get(object);
	*/
			Iterator<Map.Entry<String, List<EngageSubjects>>> it = allPaperMap.get(object).entrySet().iterator();
			while(it.hasNext()) {
				Map<String,List<EngageSubjects>> mapTemp = new HashMap<String,List<EngageSubjects>>();
				 Map.Entry<String, List<EngageSubjects>> entry = it.next();
				 mapTemp.put(entry.getKey(),entry.getValue());
				 listSubjects.add(mapTemp);
			}
		}
	}
	
	//随机抽取一份返回一个map
	List<Integer> indexList =  MyRandom.getRandomIndex(listSubjects.size(),1);
	if(listSubjects.size() == 0) {
		return null;
	}
	int index = indexList.get(0);
	System.out.println("listSubjects.size()---"+listSubjects.size());
	System.out.println("index---"+index);
	Map<String,Map> resultMap = new HashMap<String, Map>();
	resultMap.put(limitTime, (Map)listSubjects.get(index));
	System.out.println(resultMap.get(limitTime).toString());
	
	//----将考试信息(应聘者的name Idcard 应试时间 试卷编号 试题 )存入examInfoMap中
	Date t = new Date(); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Map<String,Object> examMap = new HashMap<String,Object>();
	examMap.put("IdCard", IdCard);
	examMap.put("name", name);
	examMap.put("examTime", sdf.format(t));
	examMap.put("majorKindName", pkname);
	examMap.put("majorName", pname);
	
	Map<String, List<EngageSubjects>> paperMap = resultMap.get(limitTime);
	for(Map.Entry<String, List<EngageSubjects>> entry : paperMap.entrySet()) {
		examMap.put("testPaperNumber", entry.getKey());
		examMap.put("subjectList", entry.getValue());
	}
	/*IdMap.examInfoMap.put(IdCard,examMap);*/
	 String uuid=UUID.randomUUID().toString().replace("-", "");
	IdMap.examInfoMap.put(uuid,examMap);
	return resultMap;
	}

@RequestMapping("/handInTestPaper.do")
@ResponseBody
public void handInTestPaper(@RequestParam("IdCard") String IdCard,@RequestParam("answer") String answer,@RequestParam("useTime") String useTime) {
		for(Entry<String, Map<String, Object>> entry : IdMap.examInfoMap.entrySet()) {
			if(IdCard != null && IdCard != "" && IdCard.equals(entry.getValue().get("IdCard"))) {
				entry.getValue().put("answer", answer);
				entry.getValue().put("useTime", useTime);
			}
		}
		//---------------测试IdMap中的数据-----------------------------
		/*for(Entry<String, Map<String, Object>> entry : IdMap.examInfoMap.entrySet()) {
			System.out.println("IdCard=="+entry.getKey());
			System.out.println("name=="+entry.getValue().get("name"));	
			System.out.println("examTime=="+entry.getValue().get("examTime"));	
			System.out.println("testPaperNumber=="+entry.getValue().get("testPaperNumber"));	
			System.out.println("answer=="+entry.getValue().get("answer"));	
			System.out.println("useTime=="+entry.getValue().get("useTime"));	
			System.out.println("subjectList=="+entry.getValue().get("subjectList"));
			
		}*/
	}
@RequestMapping(value="/toMarkPaper.do",method=RequestMethod.POST)
@ResponseBody
public void toMarkPaper() {
		for(Map.Entry<String, Map<String,Object>> entry : IdMap.examInfoMap.entrySet()) {
			Map<String,Object> examInfo = entry.getValue();
			String answer = (String) examInfo.get("answer");
			String[] answerArr = answer.split(",");
			int index = 0;
			double successTotal = 0;
			List<EngageSubjects> subjectList = (List<EngageSubjects>) examInfo.get("subjectList");
			for (EngageSubjects engageSubjects : subjectList) {
				index++;
				if(index <= answerArr.length-1) {
					if(answerArr[index].equals(engageSubjects.getCorrect_key())) {
						successTotal++;
					}
				}
			}
			double score = (double) Math.round(successTotal/subjectList.size()*1000)/10;
			entry.getValue().put("score", score);
		}
		//---------------测试IdMap中的数据-----------------------------
		/*for(Entry<String, Map<String, Object>> entry : IdMap.examInfoMap.entrySet()) {
			System.out.println("IdCard=="+entry.getKey());
			System.out.println("name=="+entry.getValue().get("name"));	
			System.out.println("examTime=="+entry.getValue().get("examTime"));	
			System.out.println("testPaperNumber=="+entry.getValue().get("testPaperNumber"));	
			System.out.println("answer=="+entry.getValue().get("answer"));	
			System.out.println("useTime=="+entry.getValue().get("useTime"));	
			System.out.println("subjectList=="+entry.getValue().get("subjectList"));
			System.out.println("score=="+entry.getValue().get("score"));
		}*/
	}

@RequestMapping(value="toSelect.do",method=RequestMethod.POST)
@ResponseBody
public Map<Integer,Map<String,Object>> toSelect(@RequestParam("IdCard") String IdCard,@RequestParam("key") String key,@RequestParam("startTime") String startTime,@RequestParam("endTime") String endTime,HttpServletRequest request) {		
	
	HttpSession session = request.getSession();
	session.setAttribute("IdCard", IdCard);
	session.setAttribute("key", key);
	session.setAttribute("startTime", startTime);
	session.setAttribute("endTime", endTime);
	
	Map<Integer,Map<String,Object>> resultMap = new HashMap<Integer,Map<String,Object>>();
	int resultIndex = 1;
		if(IdCard != null && IdCard != "") {
			for(Entry<String, Map<String, Object>> entry : IdMap.examInfoMap.entrySet()) {
				if(IdCard.equals(entry.getValue().get("IdCard"))) {
					resultMap.put(resultIndex++, entry.getValue());
				}
			}
		}
		if(startTime != null && startTime != "") {
			if(resultMap.isEmpty()) {
				for(Entry<String, Map<String, Object>> entry : IdMap.examInfoMap.entrySet()) {
					//>0  考试时间在开始查询时间后面	
					if(String.valueOf(entry.getValue().get("examTime")).compareTo(startTime)>0) {
						
						resultMap.put(resultIndex++, entry.getValue());
					}
				}
			}else {
				 Iterator<Integer> it  = resultMap.keySet().iterator();
			        while(it.hasNext()){
			        	/*int index2 = it.next();*/
			        	//<0  考试时间在开始查询时间前面	
						if(String.valueOf(resultMap.get(it.next()).get("examTime")).compareTo(startTime)<0) {
							it.remove();
							/*resultMap.remove(index2);*/
						}
					}
			}
		}
		//System.out.println("resultMap2---"+resultMap.toString());
		
		if(endTime != null && endTime != "") { 
			if(resultMap.isEmpty()&&(IdCard == null || IdCard == "")&&(startTime == null || startTime == "")) {
				for(Entry<String, Map<String, Object>> entry : IdMap.examInfoMap.entrySet()) {
					// >0 说明结束时间在考试时间的后面
					if(endTime.compareTo(String.valueOf(entry.getValue().get("examTime")))>0) {
						resultMap.put(resultIndex++, entry.getValue());
					}
				}
			}else {
				 Iterator<Integer> it  = resultMap.keySet().iterator();
			        while(it.hasNext()){
			        	if(String.valueOf(resultMap.get(it.next()).get("examTime")).compareTo(endTime)>0) {
			        		it.remove();
						}
			     }
			}
		}
		System.out.println("resultMap---"+resultMap.toString());
		return resultMap;
	}
}

