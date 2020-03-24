package hr.web.inerceptor;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import hr.pojo.User;
import hr.util.RoleConstants;
/**
 * 权限控制器
 * @author xyw
 *
 */
public class AccessAuthority implements HandlerInterceptor {
	
	private HashMap<String, List<String>> map = new HashMap<String, List<String>>();
	
	public AccessAuthority() {
		//应聘者
		List<String> applicant = new ArrayList<String>();
		applicant.add("/hr_ssm/engagemajorrelease/queryAll");
		applicant.add("/hr_ssm/engagemajorrelease/showDetail");
		applicant.add("/hr_ssm/engageresume/apply");
		applicant.add("/hr_ssm/engageresume/addResume");
		
		map.put(RoleConstants.APPLICANT,applicant);
		
		//人事专员
		List<String> hrSpecialist = new ArrayList<String>();
		
		
		
		map.put(RoleConstants.HRSPECIALIST, hrSpecialist);
		
		//人事经理
		List<String> hrManager = new ArrayList<String>();
		
		
		map.put(RoleConstants.HRMANAGER, hrManager);
		
		//薪酬专员
		List<String> salarySpecialist = new ArrayList<String>();
		
		map.put(RoleConstants.SALARYSPECIALIST, salarySpecialist);
		
		//薪酬经理
		List<String> salaryManager = new ArrayList<String>();

		map.put(RoleConstants.SALARYMANAGER, salaryManager);
		
		//招聘专员
		List<String> recruitSpecialist = new ArrayList<String>();
		
		//职位发布权限集
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/initAdd");
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/add");
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/queryAll");
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/showDetail");
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/initEdit");
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/Edit");
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/modify");
		recruitSpecialist.add("/hr_ssm/engagemajorrelease/deleteMajorRelease");
		
		
		//简历权限集
		recruitSpecialist.add("/hr_ssm/engageresume/choose");
		recruitSpecialist.add("/hr_ssm/engageresume/ByIdQueryMajor");
		recruitSpecialist.add("/hr_ssm/engageresume/searchByConditions");
		recruitSpecialist.add("/hr_ssm/engageresume/initCheck");
		recruitSpecialist.add("/hr_ssm/engageresume/check");
		recruitSpecialist.add("/hr_ssm/engageresume/validlist");
		recruitSpecialist.add("/hr_ssm/engageresume/validResumeById");
		recruitSpecialist.add("/hr_ssm/engageresume/toSendmail");
		
		//面试相关权限集
		recruitSpecialist.add("/hr_ssm/engageinterview/initList");
		recruitSpecialist.add("/hr_ssm/engageinterview/initAdd");
		recruitSpecialist.add("/hr_ssm/engageinterview/addInterviewOne");
		recruitSpecialist.add("/hr_ssm/engageinterview/queryAll");
		recruitSpecialist.add("/hr_ssm/engageinterview/sift");
		recruitSpecialist.add("/hr_ssm/engageinterview/updateSift");
	
		
		map.put(RoleConstants.RECRUITSPECIALIST, recruitSpecialist);
		
		//招聘经理
		List<String> recruitManager = new ArrayList<String>();
		
		//职位发布权限集
		recruitManager.add("/hr_ssm/engagemajorrelease/initAdd");
		recruitManager.add("/hr_ssm/engagemajorrelease/add");
		recruitManager.add("/hr_ssm/engagemajorrelease/queryAll");
		recruitManager.add("/hr_ssm/engagemajorrelease/showDetail");
		recruitManager.add("/hr_ssm/engagemajorrelease/initEdit");
		recruitManager.add("/hr_ssm/engagemajorrelease/Edit");
		recruitManager.add("/hr_ssm/engagemajorrelease/modify");
		recruitManager.add("/hr_ssm/engagemajorrelease/deleteMajorRelease");
		
		//简历权限集
		recruitManager.add("/hr_ssm/engageresume/choose");
		recruitManager.add("/hr_ssm/engageresume/ByIdQueryMajor");
		recruitManager.add("/hr_ssm/engageresume/searchByConditions");
		recruitManager.add("/hr_ssm/engageresume/initCheck");
		recruitManager.add("/hr_ssm/engageresume/check");
		recruitManager.add("/hr_ssm/engageresume/validlist");
		recruitManager.add("/hr_ssm/engageresume/validResumeById");
		recruitManager.add("/hr_ssm/engageresume/toSendmail");
		
		//面试相关权限集
		recruitManager.add("/hr_ssm/engageinterview/initList");
		recruitManager.add("/hr_ssm/engageinterview/initAdd");
		recruitManager.add("/hr_ssm/engageinterview/addInterviewOne");
		recruitManager.add("/hr_ssm/engageinterview/queryAll");
		recruitManager.add("/hr_ssm/engageinterview/sift");
		recruitManager.add("/hr_ssm/engageinterview/updateSift");

		
		map.put(RoleConstants.RECRUITMANAGER, recruitManager);
		
		//激励专员
		List<String> excitationSpecialist = new ArrayList<String>();
		
		
		map.put(RoleConstants.EXCITATIONSPECIALIST, excitationSpecialist);
		
		//激励经理
		List<String> excitationManager = new ArrayList<String>();
		
		map.put(RoleConstants.EXCITATIONMANAGER, excitationManager);
	}
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		System.out.println("通过");
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		
		String sb = request.getRequestURI();
		
		sb = sb.substring(0, sb.indexOf(".do"));
		System.out.println("请求:" + sb);
		
		if("/hr_ssm/user/validUname".equals(sb) || "/hr_ssm/user/login".equals(sb) 
				|| "/hr_ssm/user/register".equals(sb))
		{
			return true;
		}
		
		User curUser = (User) request.getSession().getAttribute("userlogin");
		
		if(curUser == null)
		{
			return false;
		}
		
		List<String> list = map.get(curUser.getU_role());
		boolean flag = false;
		if(list != null)
		{
			if(list.size() > 0){
				for (String string : list) {
					if(string.equals(sb))
					{
						flag = true;
					}
				}
			}
		}
		
		System.out.println(flag);
		
		if(!flag)
		{
			PrintWriter out = new PrintWriter(response.getWriter(),true);
			out.print("<h1>您的权限不够进行此操作</h1>");
		}
		return flag;
	}
}
