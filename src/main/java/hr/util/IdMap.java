package hr.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface IdMap {
	public Map<String, Integer> IDMAP = new HashMap<String, Integer>();
	public Map<String, String> firstQuestionMAP = new HashMap<String, String>();
	public Map<Object,Map> testPaperMap = new HashMap<Object,Map>();
	public Map<String,Integer> testNumberMap = new HashMap<String, Integer>();
	public Map<String,Map<String,Object>> examInfoMap = new HashMap<String, Map<String,Object>>();
}
