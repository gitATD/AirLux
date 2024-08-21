<html>
    <%@ page import = "java.io.*, java.sql.*" %>
    <body>
        <%
            String mop = request.getParameter("MoP");

            try
            {
                Connection con = null;
                Statement stmt = null;
                PreparedStatement pstmt = null;
                int s = 0;
                ResultSet rs = null;

                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
                pstmt = con.prepareStatement("update transaction set MoP = '"+mop+"' where bid = ((select bid from temp));");
                s = pstmt.executeUpdate();
                if(s==0)
                {
                    out.println("Fail");
                }
                else
                {
                    response.sendRedirect("AirLux - Success\\Success.jsp");
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>