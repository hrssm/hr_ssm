package hr.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToTimestampConverter implements Converter<String, Timestamp>{

	@Override
	public Timestamp convert(String source) {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		Timestamp timestamp = null;
		try {
			if (source == "") {
				date = null;
				timestamp = null;
			}else {
				date = format.parse(source);
				timestamp = new Timestamp(date.getTime());
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return timestamp;
	}
	
}
