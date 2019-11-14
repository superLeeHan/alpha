<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%
 class DbUtil {

    private String dbUrl = "jdbc:mysql://localhost:3306/garbagedb?serverTimezone=UTC&characterEncoding=utf-8&autoReconnect=true";
    private String dbUser = "root";
    private String dbPassword = "root";
    private String driver = "com.mysql.jdbc.Driver";

    private Connection connection = null;

    public Connection getConnection(){
        try {
            System.out.println("开始链接数据库……");
            Class.forName(driver);
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            System.out.println("数据库连接成功");
        } catch (Exception e) {
            System.out.println("数据库连接失败");
            e.printStackTrace();
        }
        return connection;
    }

    public void closeCon(){
        if(connection != null)
        try {
            connection.close();
            System.out.println("数据库已关闭");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库关闭失败");
        }
    }
}
%>
<%@ page import="java.sql.*" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>新闻单独展示</title>
    <style>
        .news_title{
            height: 50px;
            margin-top: 40px;
        }
        .news_con{
            height:50px;
        }
        .news_data{
            float: left;
            margin-left: 400px;

            padding: 0px;
        }
        .news_author{
            float: right;
            margin-right: 700px;
        }
        .news_picture{
            height: 200px;
            width: 600px;
        }
        .news_text{
            height: 1000px;
            width: 600px;
        }
        .inputs{
            border: none;
            outline: medium;
        }
    </style>
</head>
<body>
    <%
        DbUtil dbUtil=new DbUtil();
        //接收数据from news_center
        String title = request.getParameter("new");
        //查询文章内容
//        String sql="SELECT * from news where news_id=1";
        String sql="SELECT * from news where news_title = ?";
        Connection connection=dbUtil.getConnection();
        PreparedStatement pst;
        pst=connection.prepareStatement(sql);
        pst.setString(1,title);
        ResultSet rs=pst.executeQuery(sql);
        while(rs.next()){
    %>
    <form action="" method="">
        <div class="news_title"><!--新闻标题-->
            <input class="inputs" type="text" readonly="readonly"  value="<%=rs.getString(2) %>"/>
        </div>
        <div class="news_con">
            <div class="news_data"> <!--日期-->
                <input class="inputs" type="text" readonly="readonly" size="7" value="<%=rs.getString(5)%>" />
            </div>
            <div class="news_author"><!--作者 -->
                <input class="inputs" type="text" readonly="readonly" size="5" value="<%=rs.getString(6)%>" />
            </div>
        </div>
        <div class="news_picture"><!--图片-插图-->
            <input class="inputs" type="text" readonly="readonly" size="100" value="<%=rs.getString(4)%>"  />
        </div>
        <div class="news_text"><!--新闻文章内容-->
<%--            <input class="inputs" type="text" readonly="readonly" size="800" value="<%=rs.getString(3)%>" />--%>
            <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<%=rs.getString(3)%></p>
        </div>
    </form>
    <%
        }
    %>
</body>
</html>
