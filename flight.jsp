<html>
    <%@ page import = "java.io.*, java.sql.*" %>
    <body>
        <%
            String o = request.getParameter("onward_flight");
            String r = request.getParameter("return_flight");

            Connection con = null;
            Statement stmt = null;
            PreparedStatement pstmt1 = null;
            PreparedStatement pstmt2 = null;
            int s1 = 0;
            int s2 = 0;
            ResultSet rs = null;

            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                pstmt1 = con.prepareStatement("update booking set BOnward = '"+o+"' where bid = ((select bid from temp));");
                s1 = pstmt1.executeUpdate();
                if(s1==0)
                {
                    out.println("Fail");
                }
                else
                {
                    pstmt2 = con.prepareStatement("update booking set BReturn ='"+r+"' where bid = ((select bid from temp));");
                    s2 = pstmt2.executeUpdate();
                    if(s2==0)
                    {
                        out.println("Fail");
                    }
                    else
                    {
                        response.sendRedirect("AirLux - Passenger\\Passenger.jsp");
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