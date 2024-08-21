<html>
    <%@ page import = "java.io.*, java.sql.*" %>
    <body>
        <%
            Connection con = null;
            Statement stmt = null;
            PreparedStatement pstmt1 = null;
            PreparedStatement pstmt2 = null;
            int s1 = 0;
            int s2 = 0;
            ResultSet rs = null;
            int bid = 0;
            int pid = 0;
            int p_cnt = 0;
            String p_name = "";
            String p_email = "";
            String p_phone = "";
            String p_gender = "";
            String p_dob = "";

            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                stmt = con.createStatement();
                rs = stmt.executeQuery("select bid,pid from temp;");
                while(rs.next())
                {
                    bid = rs.getInt(1);
                    pid = rs.getInt(2);
                }

                pstmt1 = con.prepareStatement("insert into bp(bid,pid) values("+bid+","+pid+");");
                s1 = pstmt1.executeUpdate();
                if(s1==0)
                {
                    out.println("Fail");
                }
                else
                {
                    rs = stmt.executeQuery("select pass_cnt from temp;");
                    while(rs.next())
                    {
                        p_cnt = rs.getInt(1);
                    }

                    for(int i=1; i<=p_cnt-1; i++)
                    {
                        p_name = request.getParameter("passenger_name_"+i);
                        p_email = request.getParameter("passenger_email_"+i);
                        p_phone = request.getParameter("passenger_phone_"+i);
                        p_gender = request.getParameter("passenger_gender_"+i);
                        p_dob = request.getParameter("passenger_dob_"+i);

                        try
                        {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                            stmt = con.createStatement();
                            rs = stmt.executeQuery("select pid from passenger where email = '"+p_email+"';");
                            if(rs.next())
                            {
                                pid = rs.getInt(1);
                                pstmt2 = con.prepareStatement("insert into bp (bid,pid) values ("+bid+","+pid+");");
                                s2 = pstmt2.executeUpdate();
                                if(s2==0)
                                {
                                    out.println("Fail");
                                }
                            }
                            else
                            {
                                pstmt2 = con.prepareStatement("insert into passenger(pname,email,pphone,pgender,pdob) values (?,?,?,?,?);");
                                pstmt2.setString(1,p_name);
                                pstmt2.setString(2,p_email);
                                pstmt2.setString(3,p_phone);
                                pstmt2.setString(4,p_gender);
                                pstmt2.setString(5,p_dob);
                                s2 = pstmt2.executeUpdate();
                                if(s2==0)
                                {
                                    out.println("Fail");
                                }
                                pstmt2 = con.prepareStatement("insert into login values ('"+p_email+"','12345678');");
                                s2 = pstmt2.executeUpdate();
                                if(s2==0)
                                {
                                    out.println("Fail");
                                }
                                rs = stmt.executeQuery("select pid from passenger where email = '"+p_email+"';");
                                if(rs.next())
                                {
                                    pid = rs.getInt(1);
                                    pstmt2 = con.prepareStatement("insert into bp (bid,pid) values ("+bid+","+pid+");");
                                    s2 = pstmt2.executeUpdate();
                                    if(s2==0)
                                    {
                                        out.println("Fail");
                                    }
                                }
                            }
                        }
                        catch(Exception e)
                        {
                            out.println(e);
                        }
                    }
                    response.sendRedirect("AirLux - Payment\\Payment.jsp");
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>