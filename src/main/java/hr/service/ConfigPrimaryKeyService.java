package hr.service;

import java.util.List;

import hr.pojo.Config_primary_key;

public interface ConfigPrimaryKeyService {
	public void addConfig_primary_key(Config_primary_key config_primary_key);
	public void modifyConfig_primary_key(Config_primary_key config_primary_key);
	public Config_primary_key queryConfig_primary_keyById(int id);
	public List<Config_primary_key> queryConfig_primary_key();
	public void removeConfig_primary_keyById(int sid);
	
	public List<Config_primary_key> queryConfig_primary_key_byPk(String pk);
}
