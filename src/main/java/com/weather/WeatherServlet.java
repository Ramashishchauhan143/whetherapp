package com.weather;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import org.json.JSONObject;

public class WeatherServlet extends HttpServlet {
    private static final String API_KEY = "598d10dc398891767721ba3c21ea9e09";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        String city = request.getParameter("city");
        String urlString = "https://api.openweathermap.org/data/2.5/weather?q=" + city +
                "&appid=" + API_KEY + "&units=metric";

        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuffer content = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }

        in.close();
        conn.disconnect();

        JSONObject obj = new JSONObject(content.toString());

        request.setAttribute("city", obj.getString("name"));
        request.setAttribute("country", obj.getJSONObject("sys").getString("country"));
        request.setAttribute("temp", obj.getJSONObject("main").getDouble("temp"));
        request.setAttribute("description", obj.getJSONArray("weather").getJSONObject(0).getString("description"));
        request.setAttribute("humidity", obj.getJSONObject("main").getInt("humidity"));
        request.setAttribute("wind", obj.getJSONObject("wind").getDouble("speed"));

        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        dispatcher.forward(request, response);
    }
}
