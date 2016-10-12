package co.grandcircus.movies.rest;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import co.grandcircus.movies.model.Holiday;

/**
 * Responsibility:
 */
@Service
public class HolidayService {
	
	private final static String key = "d550f38b-861f-46c7-961d-852fc1bd25e2";
	private final static String country = "US";
	private final static String year = "2015";
	private final static String month = "10";

	public ArrayList<Holiday> getCurrentHolidays() {
		
		return getHolidaysAt(key,country,year,month);
	}
	
	public ArrayList<Holiday> getHolidaysAt(String key, String country,String year,String month) {
		String url = "https://holidayapi.com/v1/holidays?key=" + key + "&country=" + country + "&year=" + year + "&month=" + month;
		// Use HTTP GET with the above URL
		try (BufferedReader reader = HttpHelper.doGet(url)) { // try with resources will auto close the reader
			if (reader == null) {
				throw new RuntimeException("Not found: " + url);
			}
			
			
			JsonObject root = new JsonParser().parse(reader).getAsJsonObject();
			
			JsonArray holidays = root.get("holidays").getAsJsonArray();
			ArrayList<Holiday> holiday = new ArrayList<Holiday>();
			Holiday temp;
			for (int i = 0; i< holidays.size(); i++){
				temp = new Holiday();
				temp.setName(holidays.get(i).getAsJsonObject().get("name").getAsString());
				temp.setDate(holidays.get(i).getAsJsonObject().get("date").getAsString());	
				holiday.add(temp);
			}
			
			
			
			
//			holiday.setKey(holidays.get("key").getAsString());
//			holiday.setCountry(holidays.get("country").getAsString());
//			holiday.setYear(holidays.get("year").getAsString());
//			holiday.setMonth(holidays.get("month").getAsString());
			

			return holiday;
		} catch (IOException ex) {
			throw new RuntimeException("Error reading from URL: " + url, ex);
		}
	}

}