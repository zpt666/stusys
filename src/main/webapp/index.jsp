<%--
  Created by IntelliJ IDEA.
  User: json
  Date: 2021/7/28
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理系统</title>
    <link rel="stylesheet" type="text/css" href="static/css/index.css">
    <script type="text/javascript" src="static/js/jquery-3.5.1.js"></script>
    <script>
        $(function (){
            $.ajax({
                url:"getStudents.do",
                type:"get",
                success:function (res) {
                    showTable(res)
                }
            })

            function showTable(data){
                var html = "";
                html += "<tr><th>学号</th><th>姓名</th><th>年龄</th><th>性别</th><th>操作</th></tr>";
                for( var i = 0; i < data.length; i++ ) {
                    html += "<tr>";
                    html +=     "<td>" + data[i].id + "</td>";
                    html +=     "<td>" + data[i].name + "</td>";
                    html +=     "<td>" + data[i].age + "</td>";
                    html +=     "<td>" + data[i].sex + "</td>";
                    html +=     "<td><input class='remove' type='button' value='删除'></td>";
                    html += "</tr>";
                }
                $("#students").html(html);
            }

            $('body').on('click','.remove',function () {
                var row = $(this).parent().parent();
                var id = $(this).parent().parent().children(':first').text();
                if (confirm("确认删除？")){
                    $.ajax({
                        url:"removeStudentById.do",
                        type:'get',
                        data:{"id":id},
                        success:function (data){
                            if (data.res == 1){
                                alert("删除成功！");
                                row.remove();
                            }else {
                                alert("删除失败！");
                            }
                        }
                    })
                }

            })

            $("body").on('click','.add',function (){
                $("#addStudent").slideDown(1000);
            })

            $("body").on('click','.qx',function (){        
                $("#addStudent").slideUp("fast");
            })

            $('body').on('click','#submit',function (){
                var id = $('#id').val();
                var name = $('#name').val();
                var age = $('#age').val();
                var sex = $('#sex').val();
                $.ajax({
                    url:"addStudent.do",
                    type:"post",
                    data:{"id":id,"name":name,"age":age,"sex":sex},
                    success:function (data) {
                        if (data.res == 1){
                            alert("添加成功！");
                            $('table').append("<tr><td>"+id+"</td><td>"+name+"</td><td>"+age+"</td><td>"+sex+"</td><td><input class='remove' type='button' value='删除'></td></tr>")
                            $("#addStudent").slideUp("fast");
                            $("#addStudent input").val("");
                        }else {
                            alert("添加失败！");
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<h1 align="center">学生管理</h1>
<table id="students" border="1">
    
</table>
<center><input class="add" type="button" value="添加"></center>
<div id="addStudent">
    <center>
        学号：<input id="id" type="text"><br>
        姓名：<input id="name" type="text"><br>
        年龄：<input id="age" type="text"><br>
        性别：<input id="sex" type="text"><br>
    </center>
    <center><button style="margin-top: 30px" class="qx">取消</button><button id="submit">提交</button> </center>
</div>
</body>
</html>
