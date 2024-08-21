<html>
    <%@ page import = "java.io.*, java.sql.*" %>
    <body>
        <%
            String o = request.getParameter("from_city");
            String d = request.getParameter("to_city");
            String ttype = request.getParameter("triptype");
            String odate = request.getParameter("onward_date");
            String rdate = request.getParameter("return_date");
            int p_cnt = 0;
            p_cnt = Integer.parseInt(request.getParameter("pax"));

            int pid = 0;

            Connection con = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
            PreparedStatement pstmt3 = null;
            PreparedStatement pstmt4 = null;
            PreparedStatement pstmt5 = null;
            PreparedStatement pstmt6 = null;
            
            ResultSet rs = null;
			int s = 0;
			int s2 = 0;
            int s3 = 0;
            int s4 = 0;
            int s5 = 0;
            int s6 = 0;

            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                stmt = con.createStatement();
                rs = stmt.executeQuery("select max(pid) from temp");

                while(rs.next())
                {
                    pid = rs.getInt(1);
                }

                pstmt = con.prepareStatement("insert into booking (BType,BODate,BRDate,PID) values (?,?,?,?);");
                pstmt.setString(1,ttype);
                pstmt.setString(2,odate);
                pstmt.setString(3,rdate);
                pstmt.setInt(4,pid);

                s = pstmt.executeUpdate();
                if(s==0)
                {
                    out.println("Fail");
                }
                else
                {
                    pstmt2 = con.prepareStatement("update temp set Origin = '"+o+"' where pid = "+pid+";");
                    s2 = pstmt2.executeUpdate();
                    if(s2==0)
                    {
                        out.println("Fail");
                    }
                    else
                    {
                        pstmt3 = con.prepareStatement("update temp set Destination = '"+d+"' where pid = "+pid+";");
                        s3 = pstmt3.executeUpdate();
                        if(s3==0)
                        {
                            out.println("Fail");
                        }
                        else
                        {
                            pstmt4 = con.prepareStatement("update temp set BID = (select max(BID) from booking);");
                            s4 = pstmt4.executeUpdate();
                            if(s4==0)
                            {
                                out.println("Fail");
                            }
                            else
                            {
                                pstmt5 = con.prepareStatement("update temp set pass_cnt = "+p_cnt+";");
                                s5 = pstmt5.executeUpdate();
                                if(s5==0)
                                {
                                    out.println("Fail");
                                }
                                else
                                {
                                    pstmt6 = con.prepareStatement("update temp set btype = '"+ttype+"';");
                                    s6 = pstmt6.executeUpdate();
                                    if(s6==0)
                                    {
                                        out.println("Fail");
                                    }
                                    else
                                    {
                                        response.sendRedirect("AirLux - Flight_Select\\Flight_Select.jsp");
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>