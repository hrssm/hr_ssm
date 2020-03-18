package hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.mapper.EngageMajorReleaseMapper;
import hr.pojo.Engage_major_release;
import hr.service.Engage_Major_ReleaseService;

@Service
public class Engage_Major_ReleaseServiceImpl implements Engage_Major_ReleaseService{
	
	@Autowired
	private EngageMajorReleaseMapper engageMarjorReleaseMapper;

	@Override
	public List<Engage_major_release> queryEngageMajorReleaseAll() {
		// TODO Auto-generated method stub
		return engageMarjorReleaseMapper.findEngageMajorReleaseAll();
	}

	@Override
	public Engage_major_release queryEngageMajorReleaseById(String mre_id) {
		// TODO Auto-generated method stub
		return engageMarjorReleaseMapper.findEngageMajorReleaseById(mre_id);
	}

	@Override
	public void addEngageMajorRelease(Engage_major_release engage_major_release) {
		// TODO Auto-generated method stub
		engageMarjorReleaseMapper.insertEngageMajorRelease(engage_major_release);
	}

	@Override
	public void modifyEngageMajorRelease(Engage_major_release engage_major_release) {
		// TODO Auto-generated method stub
		engageMarjorReleaseMapper.updateEngageMajorRelease(engage_major_release);
	}

	@Override
	public void removeEngageMajorReleaseById(String mre_id) {
		// TODO Auto-generated method stub
		
	}
	
}
