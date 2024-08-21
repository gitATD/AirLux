<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Success</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/material-icons.min.css">
    <link rel="stylesheet" href="assets/css/Animated-Type-Heading.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<%@ page import = "java.io.*, java.sql.*" %>
<body>
    <script>
        function display()
        {
           window.print();
        }
    </script>
    <%
        String p_name = "";
        int bid = 0;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ResultSet rs1 = null;

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
            rs = stmt.executeQuery("select bid from temp;");
            while(rs.next())
            {
                bid = rs.getInt(1);
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    %>
    <%
        String o1 = "";
        String o2 = "";
        String d1 = "";
        String d2 = "";
        String fno1 = "";
        String fno2 = "";
        String t1 = "";
        String t2 = "";
        String t3 = "";
        String t4 = "";
        String ta = "";
        String tb = "";
        String tdate1 = "";
        String tdate2 = "";
        String btype = "";
        int p_cnt = 0;

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select origin, destination from temp;");
            while(rs.next())
            {
                o1 = rs.getString(1);
                d1 = rs.getString(2);
                d2 = o1;
                o2 = d1;
            }
            rs = stmt.executeQuery("select pass_cnt from temp;");
            while(rs.next())
            {
                p_cnt = rs.getInt(1);
            }
            rs = stmt.executeQuery("select * from flight where flightno = ((select bonward from booking where bid = ((select bid from temp))));");
            while(rs.next())
            {
                fno1 = rs.getString(1);
                t1 = rs.getString(4);
                t2 = rs.getString(6);
                ta = t1+" - "+t2;
            }
            rs = stmt.executeQuery("select * from flight where flightno = ((select breturn from booking where bid = ((select bid from temp))));");
            while(rs.next())
            {
                fno2 = rs.getString(1);
                t3 = rs.getString(4);
                t4 = rs.getString(6);
                tb = t3+" - "+t4;
            }
            rs = stmt.executeQuery("select bodate,brdate,btype from booking where bid = ((select bid from temp));");
            while(rs.next())
            {
                tdate1 = rs.getString(1);
                tdate2 = rs.getString(2);
                btype = rs.getString(3);
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    %>
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
    </header>
    <div style="text-align: center;transform: scale(0.69);margin-top: 2px;padding-top: 48px;"><i class="material-icons" data-aos="zoom-in" style="font-size: 146px;color: var(--bs-teal);">done</i>
        <h1 data-aos="fade-down">Booking Successful</h1>
    </div>
    <div style="transform: scale(0.95);">
        <div class="card" data-aos="zoom-in-down">
            <div class="card-body">
                <h4 class="card-title"><% out.println("Booking ID: "+bid); %></h4>
                <h6 class="text-muted card-subtitle mb-2"><% out.println("Booking made by "+p_name); %></h6>
                <div class="row">
                    <div class="col-auto m-auto">
                        <div style="width: 943px;box-shadow: 0px 0px 5px;border-radius: 30px;">
                            <section style="margin-right: 0px;width: 950px;">
                                <div class="container">
                                    <div class="row" style="width: 941px;">
                                        <div class="col-md-12">
                                            <h5 class="text-center"><% out.println(o1+" - "+d1); %></h5>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 945px;">
                                        <div class="col-auto m-auto"><label class="col-form-label"><% out.println(fno1); %></label></div>
                                    </div>
                                    <div class="row" style="width: 945px;">
                                        <div class="col-auto m-auto"><label class="col-form-label"><% out.println(t1+" - "+t2); %></label></div>
                                    </div>
                                    <div class="row" style="width: 945px;">
                                        <div class="col-auto m-auto"><label class="col-form-label"><% out.println(""+tdate1); %></label></div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                <%
                    int fare1 = 0;
                    int fare2 = 0;
                    int fee = 3000;
                    int total = 0;
                    
                    try
                    {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("select price from flight where flightno = ((select bonward from booking where bid = ((select bid from temp))));");
                        while(rs.next())
                        {
                            fare1 = rs.getInt(1);
                        }
                        if(btype.equals("RT"))
                        {
                            rs = stmt.executeQuery("select price from flight where flightno = ((select breturn from booking where bid = ((select bid from temp))));");
                            while(rs.next())
                            {
                                fare2 = rs.getInt(1);
                            }   
                            out.println("<div class='row' style='margin-top: 30px;'>"+
                                            "<div class='col-auto m-auto'>"+
                                                "<div style='width: 943px;box-shadow: 0px 0px 5px;border-radius: 30px;'>"+
                                                    "<section style='margin-right: 0px;width: 950px;'>"+
                                                        "<div class='container'>"+
                                                            "<div class='row' style='width: 941px;'>"+
                                                                "<div class='col-md-12'>"+
                                                                    "<h5 class='text-center'>"+o2+" - "+d2+"</h5>"+
                                                                "</div>"+
                                                            "</div>"+
                                                            "<div class='row' style='width: 945px;'>"+
                                                                "<div class='col-auto m-auto'><label class='col-form-label'>"+fno2+"</label></div>"+
                                                            "</div>"+
                                                            "<div class='row' style='width: 945px;'>"+
                                                                "<div class='col-auto m-auto'><label class='col-form-label'>"+t3+" - "+t4+"</label></div>"+
                                                            "</div>"+
                                                            "<div class='row' style='width: 945px;'>"+
                                                                "<div class='col-auto m-auto'><label class='col-form-label'>"+tdate2+"</label></div>"+
                                                            "</div>"+
                                                        "</div>"+
                                                    "</section>"+
                                                "</div>"+
                                            "</div>"+
                                        "</div>"+
                            "");
                        }
                        total = ((fare1+fare2)*p_cnt)+fee;
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
                <div class="row" style="margin-top: 30px;">
                    <div class="col-auto m-auto">
                        <div style="width: 943px;box-shadow: 0px 0px 5px;border-radius: 30px;">
                            <section style="margin-right: 0px;width: 950px;">
                                <div class="container">
                                    <div class="row" style="width: 941px;">
                                        <div class="col-md-12">
                                            <h5 class="text-center">Passenger(s)</h5>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 940px;">
                                        <div class="col-auto" style="margin-left: 14px;">
                                            <ol>
                                                <%
                                                    try
                                                    {
                                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                                        con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                                                        stmt = con.createStatement();
                                                        rs1 = stmt.executeQuery("select pname from passenger where pid in ((select pid from bp where bid = ((select bid from temp))));");
                                                        while(rs1.next())
                                                        {
                                                            out.println("<li>"+(rs1.getString(1))+"</li>");
                                                        }
                                                    }
                                                    catch(Exception e)
                                                    {
                                                        out.println(e);
                                                    }
                                                %>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 30px;">
                    <div class="col-auto m-auto">
                        <div style="width: 943px;box-shadow: 0px 0px 5px;border-radius: 30px;">
                            <section style="margin-right: 0px;width: 950px;">
                                <div class="container">
                                    <div class="row" style="width: 941px;">
                                        <div class="col-md-12">
                                            <h5 class="text-center">Fare Details</h5>
                                        </div>
                                    </div>
                                    <div class="row" style="width: 940px;">
                                        <div class="col-auto m-auto" style="margin-left: 14px;"><label class="col-form-label"><% out.println("Base Fare - "+((fare1+fare2)*p_cnt)); %></label></div>
                                    </div>
                                    <div class="row" style="width: 940px;">
                                        <div class="col-auto m-auto" style="margin-left: 14px;"><label class="col-form-label"><% out.println("Taxes and Convenience Fees - "+(fee)); %></label></div>
                                    </div>
                                    <div class="row" style="width: 940px;">
                                        <div class="col-auto m-auto" style="margin-left: 14px;"><label class="col-form-label fs-3"><% out.println("Total - "+total); %></label></div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: 30px;">
        <div class="container">
            <div class="row">
                <div class="col-auto col-md-12 text-center m-auto"><button class="btn btn-dark" data-bss-hover-animate="pulse" type="submit" style="width: 75%;" onclick="display()">Print</button></div>
            </div>
        </div>
    </div>
    <footer class="text-center bg-dark" style="padding-top: 0px;margin-top: 60px;">
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
    <script src="assets/js/Animated-Type-Heading.js"></script>
</body>

</html>