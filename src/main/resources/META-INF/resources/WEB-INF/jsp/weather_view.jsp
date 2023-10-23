<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weather API</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Add your custom CSS link here for scroll behavior -->
    <link rel="stylesheet" href="/css/scroll_behaviour.css">
</head>
<body>

	
	</div>

    <!-- Navbar with Login and Registration Tabs -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Weather App</a>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="weather-tab" data-toggle="tab" href="#weather" role="tab" aria-controls="weather" aria-selected="true">Weather</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="false">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="registration-tab" data-toggle="tab" href="#registration" role="tab" aria-controls="registration" aria-selected="false">Registration</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="tab-content" id="myTabContent">
            <!-- Weather Search Tab -->
            <div class = "col-5">
			
				<form action = "" method = "get">
					<input class = "form-control" name = "city" type = "text"  placeholder = "Your city" required/><br/>
					<input class = "form-control" id = "country" name = "country" type = "text" value = "" placeholder = "Your country's ISO code (not required)"/><br/>
					<button type = "submit" formaction = "/current/weather" name = "current" class = "btn btn-success btn-sm">Find out the current weather!</button>
					<button type = "submit" formaction = "/five_day/weather" name = "five_day" class = "btn btn-info btn-sm">Find out 5 day forecast!</button>
				</form>
				
			</div>
                <c:if test="${error}">
                    <p style="color: red; text-align: center;">Invalid entry.</p>
                </c:if>
            </div>

            <!-- Login Tab -->
            <div class="tab-pane fade" id="login" role="tabpanel" aria-labelledby="login-tab">
                <!-- Your login form goes here -->
            </div>

            <!-- Registration Tab -->
            <div class="tab-pane fade" id="registration" role="tabpanel" aria-labelledby="registration-tab">
                <!-- Your registration form goes here -->
            </div>
        </div>
    </div>

    <!-- ISO Codes -->
    <div id="iso_codes" class="card mt-4">
        <div class="card-body" align="center">
            <h3 style="text-decoration: underline;">Countries and their ISO codes</h3><br/>
            <p>To search for your country, hold 'Ctrl' and press 'F' and then enter your country</p>
            <table class="table table-striped table-sm">
                <thead class="bg-dark text-white">
                    <tr>
                        <th>Country</th>
                        <th>ISO Code</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${codes}" var="list">
                        <tr>
                            <td>${list.key}</td>
                            <td>
                                <a href="#weather_search">
                                    <button class="btn btn-outline-info btn-sm" value="${list.value}" onclick="addISOCode(value)">
                                        ${list.value}
                                    </button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add your custom JavaScript for ISO code functionality here -->
    <script src="/js/search-iso-codes.js"></script>

    <!-- Add other Bootstrap and JavaScript libraries as needed -->

</body>
</html>
