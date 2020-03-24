package hr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.HumanFileMapper;
import hr.pojo.HumanFile;
import hr.service.HumanFileService;

@Service
public class HumanFileServiceImpl implements HumanFileService{
	@Autowired
	private HumanFileMapper mapper = null;
	
	@Override
	public boolean saveHumanFile(HumanFile humanfile) {
		return mapper.insertHumanFile(humanfile);
	}

	@Override
	public boolean modifyHumanFileById(HumanFile humanfile) {
		return mapper.updateHumanFileById(humanfile);
	}

	@Override
	public boolean removeHumanFileById(int id) {
		return mapper.deleteHumanFileById(id);
	}

	@Override
	public HumanFile queryHumanFileById(int id) {
		return mapper.selectHumanFileById(id);
	}

	@Override
	public List<HumanFile> queryHumanFile() {
		return mapper.selectHumanFile();
	}

	@Override
	public int queryHumanFileCount() {
		return mapper.selectHumanFileCount();
	}

	@Override
	public List<HumanFile> queryHumanFileCondition(HashMap<String, Object> map) {
		return mapper.selectHumanFileCondition(map);
	}

	@Override
	public boolean modifyHumanFileStatus(HumanFile humanfile) {
		return mapper.updateHumanFileStatus(humanfile);
	}

}
