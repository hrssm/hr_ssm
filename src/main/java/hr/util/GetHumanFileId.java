package hr.util;

public class GetHumanFileId {
	
	public static String getHumanFileIdById(int id) {
		String hfid = "bt0000000000";
		String sid = new String().valueOf(id);
		hfid.substring(0, (hfid.length()-1)-sid.length());
		hfid = hfid + sid;
		return hfid;
	}
	public static String getSalaryIdById(int id) {
		String hfid = "1000000";
		id++;
		String sid = new String().valueOf(id);
		hfid = hfid.substring(0, (hfid.length())-sid.length());
		hfid = hfid + sid;
		return hfid;
	}
	
	public static String getSalaryGrantIdById(int id) {
		String hfid = "HS1000000000";
		String sid = new String().valueOf(id);
		hfid = hfid.substring(0, (hfid.length())-sid.length());
		hfid = hfid + sid;
		return hfid;
	}
	
}
