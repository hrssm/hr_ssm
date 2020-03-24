package hr.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import hr.pojo.EngageSubjects;

public interface EngageSubjectsMapper {
	public boolean saveEngageSubjects(EngageSubjects engageSubjects);
	public boolean deleteEngageSubjectsById(int id);
	public boolean updateEngageSubjectsById(EngageSubjects engageSubjects);
	public EngageSubjects selectEngageSubjectsById(int id);
	public List<EngageSubjects> selectAllEngageSubjects();
	public Integer selectMaxId(); 
	public List<EngageSubjects> selectEngageSubjectsByCondition(HashMap<String,Object> map);
	public List<EngageSubjects> selectSubjectGroup();
}
