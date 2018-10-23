<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Example</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <script src="http://code.jquery.com/jquery-1.11.3.min.js" charset="utf-8"></script>
    <script src="${ contextPath }/resources/js/rater.js" charset="utf-8"></script>
    <script>
    
    	var a;	
    	
        $(document).ready(function(){
            var options = {
                max_value: 5,
                step_size: 0.5,
                selected_symbol_type: 'fontawesome_star',
                url: 'starTest.bo',
                initial_value: 3,
                update_input_field_name: $("#input2")
            }
            /* $(".rate").rate(); */

            $(".rate2").rate(options);

            $(".rate2").on("change", function(ev, data){
                console.log(data.from, data.to);
                a = data.to;
                console.log(a);
            });

           

            

        });
    </script>

    <style>

        .rate-base-layer
        {
            color: #aaa;
        }
        .rate-hover-layer
        {
            color: orange;
        }
        .rate2
        {
            font-size: 35px;
        }
        .rate2 .rate-hover-layer
        {
            /* color: pink; */
            color: #aaa;
        }
        .rate2 .rate-select-layer
        {
            /* color: red; */
            color: orange;
        }
        
   

    </style>
</head>
<body>
    <!-- <div class="rate"></div> -->
    <div class="rate2"></div>
    <input id="input2" type="text">

<!-- 
    <hr>
    <div id="rate6"></div> -->

</body>
</html>