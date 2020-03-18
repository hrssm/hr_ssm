package hr.service;

import java.util.List;

import hr.pojo.Engage_major_release;

public interface Engage_Major_ReleaseService {
	public List<Engage_major_release> queryEngageMajorReleaseAll();
	public Engage_major_release queryEngageMajorReleaseById(String mre_id);
	public void addEngageMajorRelease(Engage_major_release engage_major_release);
	public void modifyEngageMajorRelease(Engage_major_release engage_major_release);
	public void removeEngageMajorReleaseById(String mre_id);
}
