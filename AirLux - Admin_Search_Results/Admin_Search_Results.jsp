<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Admin Search Results</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css">
</head>
<%@ page import = "java.io.*, java.sql.*" %>
<body style="background: var(--bs-gray-900);">
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
            rs = stmt.executeQuery("select AName from admin where AID = ((select PID from temp));");
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
    <header>
        <nav class="navbar navbar-dark navbar-expand-md fixed-top bg-dark bg-gradient py-3">
            <div class="container"><a class="navbar-brand d-flex align-items-center" href="#"><span class="fw-light" style="transform: scale(1.42);">AirLux</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-5"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-5">
                    <div class="dropdown ms-auto"><a aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="far fa-user" style="color: var(--bs-white);transform: scale(1.66);"></i> </a>
                        <div class="dropdown-menu" style="margin-right: 72px;padding-left: 0px;margin-left: -132px;">
                            <h6 class="dropdown-header text-center"><% out.println(p_name); %></h6><a class="dropdown-item" href="http://localhost:8888/Ashutosh/jsp/AirLux - LogIn/LogIn.html" style="font-size: 12px;text-align: center;">Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <%
        int bid = 0;
        String b_id = "";
        b_id = request.getParameter("booking_id");
        if(b_id.equals(""))
        {
            bid = 0;
        }
        else
        {
            bid = Integer.parseInt(b_id);
        }
        String p__name = "";
        p__name = request.getParameter("passenger_name");
        String fno = "";
        fno = request.getParameter("flight_no");
    %>
    <section data-aos="fade-down" style="margin-top: 110px;">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center card-title">Booking</h4>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <%
                                        out.println("<tr>"+
                                                        "<th>BID</th>"+
                                                        "<th>BType</th>"+
                                                        "<th>BOnward</th>"+
                                                        "<th>BODate</th>"+
                                                        "<th>BReturn</th>"+
                                                        "<th>BRDate</th>"+
                                                        "<th>PID</th>"+
                                                    "</tr>");

                                        if(bid!=0)
                                        {
                                            try
                                            {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery("select * from booking where bid = "+bid+";");
                                                while(rs.next())
                                                {
                                                    out.println("<tr>"+
                                                                    "<td>"+rs.getInt(1)+"</td>"+
                                                                    "<td>"+rs.getString(2)+"</td>"+
                                                                    "<td>"+rs.getString(3)+"</td>"+
                                                                    "<td>"+rs.getString(4)+"</td>"+
                                                                    "<td>"+rs.getString(5)+"</td>"+
                                                                    "<td>"+rs.getString(6)+"</td>"+
                                                                    "<td>"+rs.getInt(7)+"</td>"+
                                                                "</tr>");
                                                } 
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e);
                                            }
                                        }
                                        else
                                        {
                                            try
                                            {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery("select * from booking;");
                                                while(rs.next())
                                                {
                                                    out.println("<tr>"+
                                                                    "<td>"+rs.getInt(1)+"</td>"+
                                                                    "<td>"+rs.getString(2)+"</td>"+
                                                                    "<td>"+rs.getString(3)+"</td>"+
                                                                    "<td>"+rs.getString(4)+"</td>"+
                                                                    "<td>"+rs.getString(5)+"</td>"+
                                                                    "<td>"+rs.getString(6)+"</td>"+
                                                                    "<td>"+rs.getInt(7)+"</td>"+
                                                                "</tr>");
                                                } 
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e);
                                            }
                                        }
                                    %>
                                </table>
                            </div>

                            <h4 class="text-center card-title">Passenger</h4>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <%
                                    out.println("<tr>"+
                                                    "<th>PID</th>"+
                                                    "<th>PName</th>"+
                                                    "<th>Email</th>"+
                                                    "<th>PPhone</th>"+
                                                    "<th>PGender</th>"+
                                                    "<th>PDOB</th>"+
                                                "</tr>");

                                        if(!p__name.equals(""))
                                        {
                                            try
                                            {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery("select * from passenger where pname = '"+p__name+"';");
                                            
                                                while(rs.next())
                                                {
                                                    out.println("<tr>"+
                                                                    "<td>"+rs.getInt(1)+"</td>"+
                                                                    "<td>"+rs.getString(2)+"</td>"+
                                                                    "<td>"+rs.getString(3)+"</td>"+
                                                                    "<td>"+rs.getString(4)+"</td>"+
                                                                    "<td>"+rs.getString(5)+"</td>"+
                                                                    "<td>"+rs.getString(6)+"</td>"+
                                                                "</tr>");
                                                } 
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e);
                                            }
                                        }
                                        else
                                        {
                                            try
                                            {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery("select * from passenger;");
                                            
                                                while(rs.next())
                                                {
                                                    out.println("<tr>"+
                                                                    "<td>"+rs.getInt(1)+"</td>"+
                                                                    "<td>"+rs.getString(2)+"</td>"+
                                                                    "<td>"+rs.getString(3)+"</td>"+
                                                                    "<td>"+rs.getString(4)+"</td>"+
                                                                    "<td>"+rs.getString(5)+"</td>"+
                                                                    "<td>"+rs.getString(6)+"</td>"+
                                                                "</tr>");
                                                } 
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e);
                                            }   
                                        }
                                    %>
                                </table>
                            </div>

                            <h4 class="text-center card-title">Flight</h4>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <%    
                                        out.println("<tr>"+
                                            "<th>FlightNo</th>"+
                                            "<th>FlightType</th>"+
                                            "<th>Origin</th>"+
                                            "<th>DTime</th>"+
                                            "<th>Destination</th>"+
                                            "<th>ATime</th>"+
                                            "<th>Price</th>"+
                                        "</tr>");
                                        if(!fno.equals(""))
                                        {
                                            try
                                            {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery("select * from flight where flightno = '"+fno+"';");
                                                while(rs.next())
                                                {
                                                    out.println("<tr>"+
                                                                    "<td>"+rs.getString(1)+"</td>"+
                                                                    "<td>"+rs.getString(2)+"</td>"+
                                                                    "<td>"+rs.getString(3)+"</td>"+
                                                                    "<td>"+rs.getString(4)+"</td>"+
                                                                    "<td>"+rs.getString(5)+"</td>"+
                                                                    "<td>"+rs.getString(6)+"</td>"+
                                                                    "<td>"+rs.getInt(7)+"</td>"+
                                                                "</tr>");
                                                } 
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e);
                                            }
                                        }
                                        else
                                        {
                                            try
                                            {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery("select * from flight;");
                                                while(rs.next())
                                                {
                                                    out.println("<tr>"+
                                                                    "<td>"+rs.getString(1)+"</td>"+
                                                                    "<td>"+rs.getString(2)+"</td>"+
                                                                    "<td>"+rs.getString(3)+"</td>"+
                                                                    "<td>"+rs.getString(4)+"</td>"+
                                                                    "<td>"+rs.getString(5)+"</td>"+
                                                                    "<td>"+rs.getString(6)+"</td>"+
                                                                    "<td>"+rs.getInt(7)+"</td>"+
                                                                "</tr>");
                                                } 
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e);
                                            }
                                        }
                                    %>
                                </table>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="text-center bg-dark" style="padding-top: 0px;margin-top: 0px;">
        <div class="container text-white py-4 py-lg-5">
            <ul class="list-inline" style="transform: scale(0.85);">
                <li class="list-inline-item me-4" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="left" title="WhatsApp"><a href="https://web.whatsapp.com/"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-whatsapp text-light" style="transform: scale(1.50);margin-right: 20px;">
                            <path d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z"></path>
                        </svg></a></li>
                <li class="list-inline-item me-4" data-bs-toggle="tooltip" data-bss-tooltip="" data-bs-placement="right" title="Telegram"><a href="https://web.telegram.org/"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-telegram text-light" style="transform: scale(1.50);margin-left: 20px;">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.287 5.906c-.778.324-2.334.994-4.666 2.01-.378.15-.577.298-.595.442-.03.243.275.339.69.47l.175.055c.408.133.958.288 1.243.294.26.006.549-.1.868-.32 2.179-1.471 3.304-2.214 3.374-2.23.05-.012.12-.026.166.016.047.041.042.12.037.141-.03.129-1.227 1.241-1.846 1.817-.193.18-.33.307-.358.336a8.154 8.154 0 0 1-.188.186c-.38.366-.664.64.015 1.088.327.216.589.393.85.571.284.194.568.387.936.629.093.06.183.125.27.187.331.236.63.448.997.414.214-.02.435-.22.547-.82.265-1.417.786-4.486.906-5.751a1.426 1.426 0 0 0-.013-.315.337.337 0 0 0-.114-.217.526.526 0 0 0-.31-.093c-.3.005-.763.166-2.984 1.09z"></path>
                        </svg></a></li>
            </ul>
            <p class="text-muted mb-0">Copyright © 2022 AirLux Pvt Ltd<br></p>
        </div>
    </footer>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
</body>
</html>