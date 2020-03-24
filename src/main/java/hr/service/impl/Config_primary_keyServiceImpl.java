package hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.Config_primary_keyMapper;
import hr.pojo.Config_primary_key;
import hr.service.Config_primary_keyService;
@Service
public class Config_primary_keyServiceImpl implements Config_primary_keyService{
	@Autowired
	private Config_primary_keyMapper cm = null;
	@Override
	public boolean addConfig_primary_key(Config_primary_key config_primary_key) {
		return cm.insertConfig_primary_key(config_primary_key);
	}

	@Override
	public boolean removeConfig_primary_keyById(int id) {
		return cm.deleteConfig_primary_keyById(id);
	}

	@Override
	public List<Config_primary_key> queryConfig_primary_key() {
		return cm.getConfig_primary_key();
	}

	@Override
	public Config_primary_key queryConfig_primary_keyById(int id) {
		return cm.selectConfig_primary_keyById(id);
	}

	@Override
	public boolean modifyConfig_primary_key(Config_primary_key config_primary_key) {
		return cm.updateConfig_primary_key(config_primary_key);
	}

}
