package hr.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import hr.pojo.HumanFile;

@Repository
public interface HumanFileMapper {
	public boolean insertHumanFile(HumanFile humanfile);
	public boolean updateHumanFileById(HumanFile humanfile);
	public boolean deleteHumanFileById(int id);
	public HumanFile selectHumanFileById(int id);
	public List<HumanFile> selectHumanFile();
	public int selectHumanFileCount();
	public List<HumanFile> selectHumanFileCondition(HashMap<String, Object> map);
	public boolean updateHumanFileStatus(HumanFile humanfile);
}
