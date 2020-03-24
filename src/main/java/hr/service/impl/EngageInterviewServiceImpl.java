package hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.EngageInterviewMapper;
import hr.pojo.EngageInterview;
import hr.service.EngageInterviewService;
@Service
public class EngageInterviewServiceImpl implements EngageInterviewService {
	
	@Autowired
	private EngageInterviewMapper mapper;
	
	@Override
	public void addEngageInterview(EngageInterview engageInterview) {
		mapper.saveEngageInterview(engageInterview);
	}

	@Override
	public void removeEngageInterviewById(int id) {
		mapper.deleteEngageInterviewById(id);
	}

	@Override
	public void modifyEngageInterviewById(EngageInterview engageInterview) {
		mapper.updateEngageInterviewById(engageInterview);
	}

	@Override
	public EngageInterview queryEngageInterviewById(int id) {
		
		return mapper.selectEngageInterviewById(id);
	}

	@Override
	public List<EngageInterview> queryAllEngageInterview() {
		// TODO Auto-generated method stub
		return mapper.selectAllEngageInterview();
	}

	@Override
	public List<EngageInterview> queryEngageInterviewByResumeId(int resumeId) {
		// TODO Auto-generated method stub
		return mapper.selectEngageInterviewByResumeId(resumeId);
	}

}
