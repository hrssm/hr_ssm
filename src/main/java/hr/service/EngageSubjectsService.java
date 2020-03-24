package hr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import hr.pojo.EngageSubjects;



public interface EngageSubjectsService {
	
	public boolean addEngageSubjects(EngageSubjects engageSubjects);
	public Integer queryMaxId();
	public List<EngageSubjects> queryEngageSubjectsByCondition(HashMap<String,Object> map);
	public boolean modifyEngageSubjects(EngageSubjects engageSubjects);
	
	public boolean removeEngageSubjects(int sub_id);
	
	public List<EngageSubjects> selectSubjectGroup();
}

