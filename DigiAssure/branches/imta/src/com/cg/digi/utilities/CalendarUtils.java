package com.cg.digi.utilities;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class CalendarUtils {
	public static List<LocalDate> getDatesBetween(String startDate,
			String endDate) {
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE;
		LocalDate sDate = LocalDate.parse(startDate, formatter);
		LocalDate eDate = LocalDate.parse(endDate, formatter);
		long numOfDaysBetween = ChronoUnit.DAYS.between(sDate, eDate);
		return IntStream.iterate(0, i -> i + 1).limit(numOfDaysBetween+1)
				.mapToObj(i -> sDate.plusDays(i)).collect(Collectors.toList());

		/*
		 * try { List<String> monthDays = new ArrayList();
		 * 
		 * SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		 * 
		 * Date d1 = format.parse(startDt); Date d2 = format.parse(endDt);
		 * 
		 * long diff = d2.getTime() - d1.getTime(); diff =
		 * TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS); for (int i = 0; i
		 * <= diff; i++) { Calendar cal = Calendar.getInstance();
		 * cal.setTime(d1); cal.add(5, i); Date x = cal.getTime(); String yy =
		 * format.format(x); monthDays.add(yy); }
		 * 
		 * return monthDays; } catch (ParseException e) { e.printStackTrace(); }
		 * return null;
		 */}
}
