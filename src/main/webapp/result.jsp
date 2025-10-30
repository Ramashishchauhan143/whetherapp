<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Weather Result</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #ece9e6, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .result-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        h1 {
            margin-bottom: 20px;
            color: #333;
        }
        p {
            font-size: 18px;
            margin: 10px 0;
            color: #555;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        @media (max-width: 600px) {
            .result-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="result-container">
        <h1>Weather in <%= request.getAttribute("city") %>, <%= request.getAttribute("country") %></h1>
        <p><strong>Temperature:</strong> <%= request.getAttribute("temp") %> °C</p>
        <p><strong>Weather:</strong> <%= request.getAttribute("description") %></p>
        <p><strong>Humidity:</strong> <%= request.getAttribute("humidity") %>%</p>
        <p><strong>Wind Speed:</strong> <%= request.getAttribute("wind") %> m/s</p>
        <a href="index.jsp">Check another city</a>
    </div>
</body>
</html>
