<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

            function parseWeather() 

            { 

                  loadJSON(function(response) 

                  {

                      var jsonData = JSON.parse(response);

                       document.getElementById("todaysWeather").innerHTML = jsonData["list"][0]["weather"][0]["main"];

                  });

            }



           function loadJSON(callback) //url의 json 데이터 불러오는 함수

           {   

              var url = "https://api.openweathermap.org/data/2.5/forecast/daily?q=Busan,KR&cnt=7&APPID=4e95de8308c48e4d1d7d0596f92d4d4d";

              var request = new XMLHttpRequest();

              request.overrideMimeType("application/json");

              request.open('GET', url, true);



              request.onreadystatechange = function () 

              {

                if (request.readyState == 4 && request.status == "200") 

                {

                  callback(request.responseText);

                }

              };

              request.send(null);  

          } 



          window.onload = function()

          {

            parseWeather();

          }

    </script>



    <body>

      <span id ="todaysWeather"></span>

    </body>

</html>