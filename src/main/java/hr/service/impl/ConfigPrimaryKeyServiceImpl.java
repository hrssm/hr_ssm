package hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.Config_primary_keyMapper;
import hr.pojo.Config_primary_key;
import hr.service.ConfigPrimaryKeyService;

@Service
public class ConfigPrimaryKeyServiceImpl implements ConfigPrimaryKeyService{
	@Autowired
	Config_primary_keyMapper cpkm;
	
	@Override
	public void addConfig_primary_key(Config_primary_key config_primary_key) {
		cpkm.insertConfig_primary_key(config_primary_key);
	}

	@Override
	public void modifyConfig_primary_key(Config_primary_key config_primary_key) {
		cpkm.updateConfig_primary_key(config_primary_key);
		
	}

	@Override
	public Config_primary_key queryConfig_primary_keyById(int id) {
		
		return cpkm.selectConfig_primary_keyById(id);
	}

	@Override
	public List<Config_primary_key> queryConfig_primary_key() {
		// TODO Auto-generated method stub
		return cpkm.getConfig_primary_key();
	}

	@Override
	public void removeConfig_primary_keyById(int sid) {
		cpkm.deleteConfig_primary_keyById(sid);
	}

	@Override
	public List<Config_primary_key> queryConfig_primary_key_byPk(String pk) {
		return cpkm.getConfig_primary_key_byPk(pk);
	}

}
