<html>
    <%@ page import="java.io.*, java.sql.*" %>
    <body>
        <%
            String P_Name=request.getParameter("name");
            String Phone=request.getParameter("phone");
            String Gender=request.getParameter("Gender");
            String dob=request.getParameter("DOB");
            String Email=request.getParameter("email");
            String Password=request.getParameter("pwd");
            String C_Password=request.getParameter("cpwd");

            Connection con = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
            PreparedStatement pstmt3 = null;

			ResultSet rs = null;
			int s = 0;
			int s2 = 0;
            int s3 = 0;

            try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/airlux","root","ashu");

                pstmt=con.prepareStatement("insert into passenger(PName,Email,PPhone,PGender,PDOB) values(?,?,?,?,?);");
                pstmt.setString(1,P_Name);
                pstmt.setString(2,Email);
                pstmt.setString(3,Phone);
                pstmt.setString(4,Gender);
                pstmt.setString(5,dob);

                if(Password.equals(C_Password))
				s = pstmt.executeUpdate();
								
				if(s==0)
				{
					out.println("Fail");
				}
				else
				{	
				    pstmt2 = con.prepareStatement("insert into login values('"+Email+"','"+Password+"');");
				    s2 = pstmt2.executeUpdate();
				}

                if(s2==0)
				{
					out.println("Fail");
				}
                else
                {
                    pstmt3=con.prepareStatement("update temp set pid = ((select pid from passenger where Email ='"+Email+"'))");
                    s3=pstmt3.executeUpdate();
                }

                if(s3==0)
                {
                    out.println("Fail");
                }
                else 
                {
                    response.sendRedirect("AirLux - Homepage\\Homepage.jsp");
                }
            }

			catch(Exception e)
			{
				out.println(e);
			}    
        %>
    </body>
</html>