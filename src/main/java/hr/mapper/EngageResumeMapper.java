package hr.mapper;

import java.util.HashMap;
import java.util.List;

import hr.pojo.EngageResume;

public interface EngageResumeMapper {
	public void saveEngageResume(EngageResume engageResume);
	public void deleteEngageResumeById(int id);
	public void updateEngageResumeById(EngageResume engageResume);
	public EngageResume selectEngageResumeById(int id);
	public List<EngageResume> selectAllEngageResume();
	public List<EngageResume> selectEngageResumeByConditions(HashMap<String,Object> map);
	
	public List<EngageResume> selectEngageResumeByCondition(EngageResume engageResume); 
	
}
