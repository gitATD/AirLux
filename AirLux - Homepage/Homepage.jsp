<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Homepage</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/Good-login-dropdown-menu-styles.css">
    <link rel="stylesheet" href="assets/css/Good-login-dropdown-menu.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <link rel="stylesheet" href="assets/css/Navbar-Right-Links-Dark-icons.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<%@ page import = "java.io.*, java.sql.*" %>
<body>
    <%
        String p_name = "";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select PName from passenger where PID = ((select PID from temp));");
            while(rs.next())
            {
                p_name = rs.getString(1);
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    %>
    <script>
        function dis_ret()
        {
            document.getElementById('ret_date').disabled = true;
        }
        function ena_ret()
        {
            document.getElementById('ret_city').disabled = false;
            document.getElementById('ret_date').disabled = false;
        }
    </script>
    <header>
        <nav class="navbar navbar-dark navbar-expand-md fixed-top bg-dark bg-gradient py-3">
            <div class="container"><a class="navbar-brand d-flex align-items-center" href="http://localhost:8888/Ashutosh/jsp/AirLux - Homepage/Homepage.jsp"><span class="fw-light" style="transform: scale(1.42);">AirLux</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-5"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-5">
                    <div class="dropdown ms-auto"><a aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="far fa-user" style="color: var(--bs-white);transform: scale(1.66);"></i> </a>
                        <div class="dropdown-menu" style="margin-right: 72px;padding-left: 0px;margin-left: -132px;">
                            <h6 class="dropdown-header text-center"><% out.println(p_name); %></h6><a class="dropdown-item" href="http://localhost:8888/Ashutosh/jsp/AirLux - LogIn/LogIn.html" style="font-size: 12px;text-align: center;">Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div data-bss-scroll-zoom="true" data-bss-scroll-zoom-speed="1" style="height: 670px;background: url(&quot;assets/img/AirLux_2.png&quot;) center / contain no-repeat;">
            <div class="container" style="height: 631px;">
                <h1 class="fw-light" data-aos="fade" data-aos-duration="1500" style="font-size: 114px;text-align: center;color: var(--bs-white);padding-top: 376px;padding-bottom: 0px;margin-bottom: 0px;margin-top: 68px;">Welcome to AirLux</h1>
            </div>
        </div>
        <div class="container">
            <section class="position-relative py-4 py-xl-5">
                <div class="container position-relative" style="width: 912px;margin-top: -20px;border-radius: 30px;border-style: solid;border-color: var(--bs-gray-900);">
                    <form method="post" action = "http://localhost:8888/Ashutosh/jsp/Home.jsp">
                        <div class="row" style="height: 45px;width: 912px;">
                            <div class="col-auto m-auto"><label class="col-form-label">From</label></div>
                            <div class="col-auto m-auto"><select class="form-select" name="from_city">
                                    <optgroup label="Origin">
                                        <option value="PNQ" selected="">Pune (PNQ)</option>
                                        <option value="BOM">Mumbai (BOM)</option>
                                        <option value="DEl">Delhi (DEL)</option>
                                        <option value="BLR">Bengaluru (BLR)</option>
                                        <option value="HYD">Hyderabad (HYD)</option>
                                    </optgroup>
                                </select></div>
                            <div class="col-auto m-auto"><label class="col-form-label">To</label></div>
                            <div class="col-auto m-auto"><select class="form-select" name="to_city" id="ret_city">
                                    <optgroup label="Destination">
                                        <option value="PNQ">Pune (PNQ)</option>
                                        <option value="BOM">Mumbai (BOM)</option>
                                        <option value="DEL" selected="">Delhi (DEL)</option>
                                        <option value="BLR">Bengaluru (BLR)</option>
                                        <option value="HYD">Hyderabad (HYD)</option>
                                    </optgroup>
                                </select></div>
                            <div class="col-auto m-auto">
                                <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1" name="triptype" value="OW" onclick="dis_ret()"><label class="form-check-label" for="formCheck-1">One Way</label></div>
                            </div>
                            <div class="col-auto m-auto">
                                <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2" name="triptype" value="RT" onclick="ena_ret()" checked=""><label class="form-check-label" for="formCheck-2">Round Trip</label></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-auto m-auto"><label class="col-form-label">Onward</label></div>
                            <div class="col-auto m-auto"><input class="form-control" type="date" name="onward_date"></div>
                            <div class="col-auto m-auto"><label class="col-form-label">Return</label></div>
                            <div class="col-auto m-auto"><input class="form-control" type="date" name="return_date" id="ret_date"></div>
                            <div class="col-auto m-auto"><label class="col-form-label">Pax</label></div>
                            <div class="col-auto m-auto"><input class="form-control" type="text" style="margin: 0px;margin-bottom: 11px;min-width: 200px;" placeholder="Pax" name="pax"></div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;margin-top: 8px;">
                            <div class="col-auto m-auto">
                                <div><button class="btn btn-primary" data-bss-hover-animate="pulse" type="submit" style="background: var(--bs-gray-900);border-style: solid;border-color: var(--bs-gray-900);width: 163.5208px;">Search Flight</button></div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <div class="container">
            <h3 class="display-5 text-center" data-aos="fade" data-aos-duration="2000">Meet our new A320 NEO!!!</h3><img src="assets/img/AirLux_1.png">
            <h6 class="display-6 fs-5 text-center">The A320 NEO is the newest member of our fleet. Flights will commence from 1 December...</h6>
        </div>
    </header>
    <footer class="text-center bg-dark" style="padding-top: 38px;">
        <div class="container text-white py-4 py-lg-5">
            <ul class="list-inline" style="padding-top: 0px;margin-top: -49px;">
                <li class="list-inline-item"><a href="https://web.whatsapp.com/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" style="color: var(--bs-white);transform: scale(1.50);margin-right: 20px;" title="WhatsApp">
                            <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                            <path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"></path>
                        </svg></a></li>
                <li class="list-inline-item"><a href="https://web.telegram.org/"><svg xmlns="http://www.w3.org/2000/svg" viewBox="-8 0 512 512" width="1em" height="1em" fill="currentColor" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="right" style="transform: scale(1.50);border-color: var(--bs-gray-900);color: var(--bs-white);margin-left: 20px;" title="Telegram">
                            <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                            <path d="M248,8C111.033,8,0,119.033,0,256S111.033,504,248,504,496,392.967,496,256,384.967,8,248,8ZM362.952,176.66c-3.732,39.215-19.881,134.378-28.1,178.3-3.476,18.584-10.322,24.816-16.948,25.425-14.4,1.326-25.338-9.517-39.287-18.661-21.827-14.308-34.158-23.215-55.346-37.177-24.485-16.135-8.612-25,5.342-39.5,3.652-3.793,67.107-61.51,68.335-66.746.153-.655.3-3.1-1.154-4.384s-3.59-.849-5.135-.5q-3.283.746-104.608,69.142-14.845,10.194-26.894,9.934c-8.855-.191-25.888-5.006-38.551-9.123-15.531-5.048-27.875-7.717-26.8-16.291q.84-6.7,18.45-13.7,108.446-47.248,144.628-62.3c68.872-28.647,83.183-33.623,92.511-33.789,2.052-.034,6.639.474,9.61,2.885a10.452,10.452,0,0,1,3.53,6.716A43.765,43.765,0,0,1,362.952,176.66Z"></path>
                        </svg></a></li>
            </ul>
            <p class="text-muted mb-0">Copyright © 2022 AirLux Pvt Ltd</p>
        </div>
    </footer>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
</body>

</html>