package hr.service;

import java.util.List;

import hr.pojo.EngageInterview;

public interface EngageInterviewService {
	public void addEngageInterview(EngageInterview engageInterview);
	public void removeEngageInterviewById(int id);
	public void modifyEngageInterviewById(EngageInterview engageInterview);
	public EngageInterview queryEngageInterviewById(int id);
	public List<EngageInterview> queryAllEngageInterview();
	public List<EngageInterview> queryEngageInterviewByResumeId(int resumeId);
}
