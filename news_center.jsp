<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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



<html lang="en">
<link rel="stylesheet" href="../css/new_center.css">
<head>
    <meta charset="UTF-8">
    <title>新闻展示页面</title>
</head>
<hr>
<!--新闻中心导航栏-->
<div class="nav">

    <ul>
        <li><img src="../img/树叶.png" alt=""></li>
        <li>易分垃圾网</li>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="garbage.jsp">分类指南</a></li>
        <li><a href="search_result.jsp">分类查询</a></li>
        <li><a href="news_center.jsp">新闻中心</a></li>
    </ul>
</div>
<div class="span1"><span>网站要闻>></span></div>

<!--新闻中心左边新闻部分-->

<%
    DbUtil dbUtil=new DbUtil();
//    String sql="SELECT * from news where news_id=2";
    String sql="SELECT * from news";
    Connection connection=dbUtil.getConnection();
    PreparedStatement pst;
    pst=connection.prepareStatement(sql);
    ResultSet rs=pst.executeQuery(sql);
    while(rs.next()){
%>

<div class="new_center-left">
<%--    <ul>--%>
<%--        <li><a href="news_print.jsp"><img src="../img/垃圾信息一.jpeg" alt=""><p>广州小伙训练鹦鹉垃圾分类 网友称赞聪明、神奇</p>  “现在国家倡导垃圾分类，我就想着人既然能做到，动物兴许也可以，所以我就教一下我的小鹦鹉。”31岁的刘先生在花都新华经营一家服装店，从小喜欢小动物的他去年过完年后就养了一只鹦鹉，并开始教授鹦鹉各种技能。最近，这只聪明的鹦鹉在刘先生的教导下竟然学会了垃圾分类，引来不少网友的围观。</a></li>--%>
<%--        <li><a href="news_print.jsp"><img src="../img/新闻信息二.jpg" alt=""><p>学劳模，做垃圾分类小达人——2019“中国好作业”完美收官</p>10月19日，2019“中国好作业”成果交流展示活动在上海教育报刊总社顺利举办。今年的“中国好作业”分为“科技、艺术、人文、实践”四大板块，超6万学生报名，共收到有效作业3万余份。经过组委会与导师们层层选拔，最终125份作业脱颖而出，分获金银铜等奖项。市文明办副主任蔡伟民，市教委德育处调研员江伟鸣，上海教育报刊总社社长仲立新等活动指导单位、主办单位负责人和部分导师代表以及获奖学员代表出席活动。</a></li>--%>
<%--        <li><a href="news_print.jsp"><img src="../img/新闻信息三.jpg" alt=""><p>南锣鼓巷“花式”推广垃圾分类</p> 扫二维码、与吉祥物合影、发活动照片到朋友圈、参与垃圾分类指导……昨天上午，一场火热的“垃圾分类有你有我，志愿服务扮靓南锣”环境美化挑战赛在南锣鼓巷拉开帷幕，游客可以实际行动助推南锣鼓巷的垃圾分类工作。</a></li>--%>
<%--        <li><a href="news_print.jsp"><img src="../img/新闻信息四.jpg" alt=""><p>天津：小志愿者助力社区环保 垃圾分类“画”出来</p>生活垃圾究竟该怎样分类？我们能为社区环保做些什么？10月15日下午，和平区劝业场街道林泉社区开展了一场特别的活动——和平区劝业场街道林泉社区小彩鸽志愿者服务队正式成立，来自林泉社区的数十名小志愿者，用手中的画笔画出了自己心中对环保的美好愿望。</a></li>--%>
<%--        <li><a href="news_print.jsp"><img src="../img/新闻信息六.jpeg" alt=""><p>垃圾桶装上“小芯片” 浦东航头镇探索农村地区垃圾分类“智治”</p>小小一枚垃圾桶上的芯片，可以收集每户垃圾产生量、追溯不合格垃圾的来源、调配垃圾收运车辆，还可以让农户在线积分、兑换生活用品……上海的垃圾分类已实施3个多月，农村地区的垃圾分类正在探索从“自治”走向“智治”，实现精准化、精细化和长效化管理。今天，记者来到浦东新区航头镇，了解农村用智能化促进垃圾减量的新手段。</a></li>--%>
<%--        <li><a href="news_print.jsp"><img src="../img/新闻信息五.jpeg" alt=""><p>“小手拉大手，垃圾分类进校园”活动走进火马冲镇中心小学</p>湖南日报.新湖南客户端10月23日讯（杨娟）“今天，我学会了怎么区分厨余垃圾、可回收物、有害垃圾和其他垃圾。回去后，我还要教给爸爸妈妈。”10月23日，火马冲镇中心小学5年级学生熊雨霞在听了志愿者讲解垃圾分类知识、参加了垃圾分类互动游戏后，开心地说道。</a></li>--%>
<%--    </ul>--%>
    <ul>
        <!--新闻内容展示-->
        <c:forEach items="" var="items">
            <!--<a href='详情.jsp?new=#(这里的#指你要传的那个东西，也就是新闻变量)'> -->
            <li><a href="news_print.jsp? new=<%=rs.getString(2)%>"><img src="<%=rs.getString(4)%>" alt="等待一会儿哦"><p><%=rs.getString(2)%></p></a></li>
        </c:forEach>
    </ul>
</div>

<%
    }
%>


<!--新闻中心右边其他新闻列表部分-->
<div class="new_center-right">
    <div class="new_center-title">
        <span>环保热点</span>
        <div class="change">
            <span>换一换</span>
            <span><a href=""><img src="../img/换一换.png" alt=""></a></span>
        </div>
    </div>
    <ul class="new_list">
        <li><a href="newinfo.html"><p><span>1</span>广州小伙训练鹦鹉垃圾分类 </p></a></li>
        <li><a href="newinfo.html"><p><span>2</span>学劳模，做垃圾分类小达人</p></a></li>
        <li><a href="newinfo.html"><p><span>3</span>南锣鼓巷“花式”推广垃圾分类</p></a></li>
        <li><a href="newinfo.html"><p><span>4</span>天津：小志愿者助力社区环保 垃圾分类“画”出来</p></a></li>
        <li><a href="newinfo.html"><p><span>5</span>垃圾桶装上“小芯片”浦东航头镇探索农村地区垃圾分类“智治”</p></a></li>
        <li><a href="newinfo.html"><p><span>6</span>“小手拉大手，垃圾分类进校园”活动走进火马冲镇中心小学</p></a></li>
        <li><a href="newinfo.html"><p><span>7</span>景宁学雷锋青年志愿服务队小志愿者在石印广场宣传垃圾分类</p></a></li>
        <li><a href="newinfo.html"><p><span>8</span>瞻前不顾后 部分城市垃圾分类流于形式</p></a></li>
        <li><a href="newinfo.html"><p><span>9</span>广深居民备战垃圾分类 天猫垃圾桶销量广东第一</p></a></li>
        <li><a href="newinfo.html"><p><span>10</span>.西湖：这个小区垃圾分类投放点很贴心</p></a></li>
    </ul></div>
<div class="span2"><span>公告栏>></span></div>
<!--公告栏部分-->
<div class="footer">
    <div class="notice">
        <ul>
            <li><span><img src="../img/手指示.png" alt=""></span><a href="newinfo.jsp">垃圾分类小知识：垃圾的危害</a></li>
            <li><span><img src="../img/手指示.png" alt=""></span><a href="newinfo.jsp">垃圾分类顺口溜</a></li>
            <li><span><img src="../img/手指示.png" alt=""></span><a href="newinfo.jsp">垃圾分类的坏处4点</a></li>
            <li><span><img src="../img/手指示.png" alt=""></span><a href="newinfo.jsp">垃圾分类名言</a></li>
            <li><span><img src="../img/手指示.png" alt=""></span><a href="newinfo.jsp">科普垃圾分类知识</a></li>
        </ul>
    </div>
    <!--政策法规部分-->
    <div class="span3"><span>政策法规>></span></div>
    <div class="new_center-policy">

        <ul>
            <li><span><img src="../img/双箭头%20右.png" alt=""></span><a href="newinfo.html">《中华人民共和国环境保护法》</a></li>
            <li><span><img src="../img/双箭头%20右.png" alt=""></span><a href="newinfo.html">《水污染防治法实施细则》</a></li>
            <li><span><img src="../img/双箭头%20右.png" alt=""></span><a href="newinfo.html">《危险废物经营许可证管理办法》</a></li>
            <li><span><img src="../img/双箭头%20右.png" alt=""></span><a href="newinfo.html">《医疗废物管理条例》</a></li>
            <li><span><img src="../img/双箭头%20右.png" alt=""></span><a href="newinfo.html">《环境保护行政处罚办法》</a></li>
        </ul>
    </div>
</div>
</body>
</html>


