package hr.service;

import java.util.HashMap;
import java.util.List;

import hr.pojo.EngageResume;

public interface EngageResumeService {
	public void addEngageResume(EngageResume engageResume);
	public void removeEngageResumeById(int id);
	public void modifyEngageResumeById(EngageResume engageResume);
	public EngageResume queryEngageResumeById(int id);
	public List<EngageResume> queryAllEngageResume();
	public List<EngageResume> queryEngageResumeByConditions(HashMap<String,Object> map);
}
