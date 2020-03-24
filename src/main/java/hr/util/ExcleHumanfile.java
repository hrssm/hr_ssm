package hr.util;

import java.io.File;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;

import hr.pojo.HumanFile;

public class ExcleHumanfile {
	public static String export(HttpServletRequest request,HttpServletResponse response,List<HumanFile> list
			,HumanFile human) {
		//创建一个workbook，对应一个Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook();
		//在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = workbook.createSheet("sheet1");
		//创建首行
		Row headRow = sheet.createRow(1);
		int cellnum = 0;
		if (human.getHuman_id() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_id());
			cellnum++;
		}
		if (human.getFirst_kind_name() != null) {
			headRow.createCell(cellnum).setCellValue(human.getFirst_kind_name());
			cellnum++;
		}
		if (human.getSecond_kind_name() != null) {
			headRow.createCell(cellnum).setCellValue(human.getSecond_kind_name());
			cellnum++;
		}
		if (human.getThird_kind_name() != null) {
			headRow.createCell(cellnum).setCellValue(human.getThird_kind_name());
			cellnum++;
		}
		if (human.getHuman_name() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_name());
			cellnum++;
		}
		if (human.getHuman_address() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_address());
			cellnum++;
		}
		if (human.getHuman_postcode() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_postcode());
			cellnum++;
		}
		if (human.getHuman_pro_designation() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_pro_designation());
			cellnum++;
		}
		if (human.getHuman_major_kind_name() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_major_kind_name());
			cellnum++;
		}
		if (human.getHunma_major_name() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHunma_major_name());
			cellnum++;
		}
		if (human.getHuman_bank() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_bank());
			cellnum++;
		}
		if (human.getHuman_account() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_account());
			cellnum++;
		}
		if (human.getHuman_telephone() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_telephone());
			cellnum++;
		}
		if (human.getHuman_mobilephone() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_mobilephone());
			cellnum++;
		}
		if (human.getHuman_email() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_email());
			cellnum++;
		}
		if (human.getHuman_hobby() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_hobby());
			cellnum++;
		}
		if (human.getHuman_speciality() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_speciality());
			cellnum++;
		}
		if (human.getHuman_sex() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_sex());
			cellnum++;
		}
		if (human.getHuman_religion() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_religion());
			cellnum++;
		}
		if (human.getHuman_party() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_party());
			cellnum++;
		}
		if (human.getHuman_nationality() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_nationality());
			cellnum++;
		}
		if (human.getHuman_race() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_race());
			cellnum++;
		}
		if (human.getHuman_birthday() != null) {
			headRow.createCell(cellnum).setCellValue("生日");
			cellnum++;
		}
		if (human.getHuman_birthplace() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_birthplace());
			cellnum++;
		}
		if (human.getHuman_age() != 0) {
			headRow.createCell(cellnum).setCellValue("年龄");
			cellnum++;
		}
		if (human.getHuman_educated_degree() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_educated_degree());
			cellnum++;
		}
		if (human.getHuman_educated_years() != 0) {
			headRow.createCell(cellnum).setCellValue("教育年限");
			cellnum++;
		}
		if (human.getHuman_educated_major() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_educated_major());
			cellnum++;
		}
		if (human.getHuman_society_security_id() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_society_security_id());
			cellnum++;
		}
		if (human.getHuman_id_card() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_id_card());
			cellnum++;
		}
		if (human.getSalary_standard_id() != null) {
			headRow.createCell(cellnum).setCellValue(human.getSalary_standard_id());
			cellnum++;
		}
		if (human.getSalary_standard_name() != null) {
			headRow.createCell(cellnum).setCellValue(human.getSalary_standard_name());
			cellnum++;
		}
		if (human.getSalary_sum() != 0) {
			headRow.createCell(cellnum).setCellValue("基本薪酬总额");
			cellnum++;
		}
		if (human.getPaid_salary_sum() != 0) {
			headRow.createCell(cellnum).setCellValue("实发薪酬总额");
			cellnum++;
		}
		if (human.getMajor_change_amount() != 0) {
			headRow.createCell(cellnum).setCellValue("调动次数");
			cellnum++;
		}
		if (human.getBonus_amount() != 0) {
			headRow.createCell(cellnum).setCellValue("激励次数");
			cellnum++;
		}
		if (human.getTraining_amount() != 0) {
			headRow.createCell(cellnum).setCellValue("培训次数");
			cellnum++;
		}
		if (human.getHuman_histroy_records() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_histroy_records());
			cellnum++;
		}
		if (human.getHuman_family_membership() != null) {
			headRow.createCell(cellnum).setCellValue(human.getHuman_family_membership());
			cellnum++;
		}
		if (human.getRemark() != null) {
			headRow.createCell(cellnum).setCellValue(human.getRemark());
			cellnum++;
		}
		if (human.getFile_chang_amount() != 0) {
			headRow.createCell(cellnum).setCellValue("档案变更累计");
			cellnum++;
		}
		if (human.getRegister() != null) {
			headRow.createCell(cellnum).setCellValue(human.getRegister());
			cellnum++;
		}
		if (human.getRegist_time() != null) {
			headRow.createCell(cellnum).setCellValue("建档时间");
			cellnum++;
		}
		
		cellnum = 0;
		int rownum = 2;
		for (HumanFile humanfile : list) {
			Row row = sheet.createRow(rownum);
			if (human.getHuman_id() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_id());
				cellnum++;
			}
			if (human.getFirst_kind_name() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getFirst_kind_name());
				cellnum++;
			}
			if (human.getSecond_kind_name() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getSecond_kind_name());
				cellnum++;
			}
			if (human.getThird_kind_name() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getThird_kind_name());
				cellnum++;
			}
			if (human.getHuman_name() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_name());
				cellnum++;
			}
			if (human.getHuman_address() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_address());
				cellnum++;
			}
			if (human.getHuman_postcode() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_postcode());
				cellnum++;
			}
			if (human.getHuman_pro_designation() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_pro_designation());
				cellnum++;
			}
			if (human.getHuman_major_kind_name() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_major_kind_name());
				cellnum++;
			}
			if (human.getHunma_major_name() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHunma_major_name());
				cellnum++;
			}
			if (human.getHuman_bank() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_bank());
				cellnum++;
			}
			if (human.getHuman_account() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_account());
				cellnum++;
			}
			if (human.getHuman_telephone() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_telephone());
				cellnum++;
			}
			if (human.getHuman_mobilephone() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_mobilephone());
				cellnum++;
			}
			if (human.getHuman_email() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_email());
				cellnum++;
			}
			if (human.getHuman_hobby() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_hobby());
				cellnum++;
			}
			if (human.getHuman_speciality() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_speciality());
				cellnum++;
			}
			if (human.getHuman_sex() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_sex());
				cellnum++;
			}
			if (human.getHuman_religion() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_religion());
				cellnum++;
			}
			if (human.getHuman_party() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_party());
				cellnum++;
			}
			if (human.getHuman_nationality() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_nationality());
				cellnum++;
			}
			if (human.getHuman_race() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_race());
				cellnum++;
			}
			if (human.getHuman_birthday() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_birthday().toString());
				cellnum++;
			}
			if (human.getHuman_birthplace() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_birthplace());
				cellnum++;
			}
			if (human.getHuman_age() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_age());
				cellnum++;
			}
			if (human.getHuman_educated_degree() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_educated_degree());
				cellnum++;
			}
			if (human.getHuman_educated_years() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_educated_years());
				cellnum++;
			}
			if (human.getHuman_educated_major() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_educated_major());
				cellnum++;
			}
			if (human.getHuman_society_security_id() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_society_security_id());
				cellnum++;
			}
			if (human.getHuman_id_card() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_id_card());
				cellnum++;
			}
			if (human.getSalary_standard_id() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getSalary_standard_id());
				cellnum++;
			}
			if (human.getSalary_standard_name() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getSalary_standard_name());
				cellnum++;
			}
			if (human.getSalary_sum() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getSalary_sum());
				cellnum++;
			}
			if (human.getPaid_salary_sum() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getPaid_salary_sum());
				cellnum++;
			}
			if (human.getMajor_change_amount() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getMajor_change_amount());
				cellnum++;
			}
			if (human.getBonus_amount() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getBonus_amount());
				cellnum++;
			}
			if (human.getTraining_amount() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getTraining_amount());
				cellnum++;
			}
			if (human.getHuman_histroy_records() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_histroy_records());
				cellnum++;
			}
			if (human.getHuman_family_membership() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getHuman_family_membership());
				cellnum++;
			}
			if (human.getRemark() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getRemark());
				cellnum++;
			}
			if (human.getFile_chang_amount() != 0) {
				headRow.createCell(cellnum).setCellValue(humanfile.getFile_chang_amount());
				cellnum++;
			}
			if (human.getRegister() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getRegister());
				cellnum++;
			}
			if (human.getRegist_time() != null) {
				headRow.createCell(cellnum).setCellValue(humanfile.getRegist_time().toString());
				cellnum++;
			}
			cellnum = 0;
			rownum ++;
		}
		String filename = "images/humanfileimages/人力资源档案"+System.currentTimeMillis()+".xlsx";
		File file = new File(request.getSession().getServletContext().getRealPath("/")+filename);
		//用流写入页面
		try {
			workbook.write(file);
//			ServletOutputStream out = response.getOutputStream();
//			workbook.write(out);
//			out.flush();
//			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file.getPath();
	}
}
