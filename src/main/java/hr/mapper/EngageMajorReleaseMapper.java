package hr.mapper;

import java.util.List;

import hr.pojo.Engage_major_release;

public interface EngageMajorReleaseMapper {
	public List<Engage_major_release> findEngageMajorReleaseAll();
	public Engage_major_release findEngageMajorReleaseById(String mre_id);
	public void insertEngageMajorRelease(Engage_major_release engage_major_release);
	public void updateEngageMajorRelease(Engage_major_release engage_major_release);
	public void deleteEngageMajorReleaseById(String mre_id);
	
	public List<Engage_major_release> selectEngageMajorReleaseGroupById();
}
