package hr.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.ConfigQuestionFirstKindMapper;
import hr.mapper.ConfigQuestionSecondKindMapper;
import hr.mapper.EngageSubjectsMapper;
import hr.pojo.ConfigQuestionFirstKind;
import hr.pojo.ConfigQuestionSecondKind;
import hr.service.EngageSubjectsService;
import hr.pojo.EngageSubjects;


@Service
public class EngageSubjectsServiceImpl implements EngageSubjectsService{
	
	@Autowired
	private EngageSubjectsMapper engageSubjectsMapper= null;
	
	
	@Override
	public boolean addEngageSubjects(EngageSubjects engageSubjects) {
		return engageSubjectsMapper.saveEngageSubjects(engageSubjects);
		
	}


	@Override
	public Integer queryMaxId() {
		// TODO Auto-generated method stub
		return engageSubjectsMapper.selectMaxId();
	}
	@Override
	public List<EngageSubjects> queryEngageSubjectsByCondition(HashMap<String,Object> map) {
		List<EngageSubjects> list = engageSubjectsMapper.selectEngageSubjectsByCondition(map);
		return engageSubjectsMapper.selectEngageSubjectsByCondition(map);
	}


	@Override
	public boolean modifyEngageSubjects(EngageSubjects engageSubjects) {
		return engageSubjectsMapper.updateEngageSubjectsById(engageSubjects);
	}


	@Override
	public boolean removeEngageSubjects(int sub_id) {
		return engageSubjectsMapper.deleteEngageSubjectsById(sub_id);
	}


	@Override
	public List<EngageSubjects> selectSubjectGroup() {
		return engageSubjectsMapper.selectSubjectGroup();
	}
		
	
}
