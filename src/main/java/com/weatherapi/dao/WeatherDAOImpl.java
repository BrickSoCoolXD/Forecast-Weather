package com.weatherapi.dao;

import java.io.IOException;

import org.springframework.stereotype.Repository;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Repository
public class WeatherDAOImpl implements WeatherDAO {

	private static final String OPENWEATHER_API_KEY = "7029d414059ca595dbe015fc53517617";
	private static final String OPENWEATHER_API_URL = "https://api.openweathermap.org/data/2.5";

	@Override
	public String getWeatherDataCity(String city, String country) throws IOException {
		return connectFiveDayForecast(city, country);
	}

	@Override
	public String getHourlyWeatherData(String city, String country) throws IOException {
		return connectFiveDayForecast(city, country);
	}

	@Override
	public String getCurrentWeatherData(String city) throws IOException {
		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder()
				.url(OPENWEATHER_API_URL + "/weather?q=" + city + "&appid=" + OPENWEATHER_API_KEY)
				.get()
				.build();

		return getResponse(client, request);
	}

	private String connectFiveDayForecast(String city, String country) throws IOException {
		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder()
				.url(OPENWEATHER_API_URL + "/forecast?q=" + city + "," + country + "&appid=" + OPENWEATHER_API_KEY)
				.get()
				.build();

		return getFiveDayResponse(client, request);
	}

	private String getFiveDayResponse(OkHttpClient client, Request request) throws IOException {
		Response response = client.newCall(request).execute();
		String getResponseBody = response.body().string();
		return getResponseBody;
	}

	private String getResponse(OkHttpClient client, Request request) throws IOException {
		Response response = client.newCall(request).execute();
		String getResponseBody = response.body().string();
		return getResponseBody;
	}
}
