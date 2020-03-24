package hr.mapper;

import java.util.List;

import hr.pojo.EngageInterview;


public interface EngageInterviewMapper {
	public void saveEngageInterview(EngageInterview engageInterview);
	public void deleteEngageInterviewById(int id);
	public void updateEngageInterviewById(EngageInterview engageInterview);
	public EngageInterview selectEngageInterviewById(int id);
	public List<EngageInterview> selectAllEngageInterview();
	public List<EngageInterview> selectEngageInterviewByResumeId(int resumeId);
}
