package hr.web.servlet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.context.ApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class MyInitDispatcherServlet extends DispatcherServlet{
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		HashMap<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> applicant = new ArrayList<String>();
		applicant.add("/hr_ssm/engagemajorrelease/queryAll.do");
		
		map.put("applicant",applicant);
		
		ServletContext application = config.getServletContext();
		application.setAttribute("authority", map);
	}
}
