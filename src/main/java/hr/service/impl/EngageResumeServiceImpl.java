package hr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.EngageResumeMapper;
import hr.pojo.EngageResume;
import hr.service.EngageResumeService;
@Service
public class EngageResumeServiceImpl implements EngageResumeService{
	
	@Autowired
	private EngageResumeMapper engageResumeMapper;
	
	@Override
	public void addEngageResume(EngageResume engageResume) {
		engageResumeMapper.saveEngageResume(engageResume);
	}

	@Override
	public void removeEngageResumeById(int id) {
		engageResumeMapper.deleteEngageResumeById(id);
	}

	@Override
	public void modifyEngageResumeById(EngageResume engageResume) {
		engageResumeMapper.updateEngageResumeById(engageResume);
	}

	@Override
	public EngageResume queryEngageResumeById(int id) {
		return engageResumeMapper.selectEngageResumeById(id);
	}

	@Override
	public List<EngageResume> queryAllEngageResume() {
		return engageResumeMapper.selectAllEngageResume();
	}
	
	public List<EngageResume> queryEngageResumeByConditions(HashMap<String,Object> map){
		return engageResumeMapper.selectEngageResumeByConditions(map);
	}


	public List<EngageResume> queryEngageResumeByCondition(EngageResume engageResume)  {
		return engageResumeMapper.selectEngageResumeByCondition(engageResume);
	}
}
