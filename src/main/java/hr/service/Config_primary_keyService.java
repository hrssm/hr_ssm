package hr.service;

import java.util.List;

import hr.pojo.Config_primary_key;
import hr.pojo.Salary_item;

public interface Config_primary_keyService {
	public boolean addConfig_primary_key(Config_primary_key config_primary_key);
	public boolean removeConfig_primary_keyById(int id);
	public List<Config_primary_key> queryConfig_primary_key();
	public Config_primary_key queryConfig_primary_keyById(int id);
	public boolean modifyConfig_primary_key(Config_primary_key config_primary_key);
}
