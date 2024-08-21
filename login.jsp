<html>
    <%@ page import="java.io.*, java.sql.*" %>
    <body>
        <%
            String email = request.getParameter("email");
		    String Password = request.getParameter("pwd");
			String admin_domain = "@airlux.com";

            Connection con;
		    Statement stmt;
            PreparedStatement pstmt;
		    ResultSet rs;
			int s = 0;

            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
			    con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");
			    stmt = con.createStatement();
				if(email.contains(admin_domain))
				{
					rs = stmt.executeQuery("select password from login where Email = '"+email+"';");
					if(rs.next())
					{
						String pass = rs.getString(1);
						
						if(pass.equals(Password))
						{
							pstmt=con.prepareStatement("update temp set pid = ((select aid from admin where Email ='"+email+"'));");
							s = pstmt.executeUpdate();
							if(s==0)
							{
								out.println("Fail");
							}
							else
							{
								response.sendRedirect("AirLux - Admin_Dashboard\\Admin_Dashboard.jsp");
							}
						}
						else
						{
							response.sendRedirect("Login_Page\\LogIn.html");
						}
					}
					else
					{
						out.println("Such credentials do not exist in our database... Please try something else");
					}
				}
				else
				{
					rs = stmt.executeQuery("select password from login where Email = '"+email+"';");
					if(rs.next())
					{
						String pass = rs.getString(1);
						
						if(pass.equals(Password))
						{
							pstmt=con.prepareStatement("update temp set pid = ((select pid from passenger where Email ='"+email+"'));");
							s = pstmt.executeUpdate();
							if(s==0)
							{
								out.println("Fail");
							}
							else
							{
								response.sendRedirect("AirLux - Homepage\\Homepage.jsp");
							}
						}
						else
						{
							response.sendRedirect("Login_Page\\LogIn.html");
						}
					}
					else
					{
						out.println("Such credentials do not exist in our database... Please try something else");
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