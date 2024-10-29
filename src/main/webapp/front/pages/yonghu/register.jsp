<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>注册</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
    addEventListener("load", function () {
      setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
      window.scrollTo(0, 1);
    }
  </script>
  <link rel="stylesheet" href="../../layui/css/layui.css">
  <link rel="stylesheet" href="../../xznstatic/css/style.css" type="text/css" media="all">
  <link href="../../xznstatic/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>
  <div id="mian" class="main-bg">
    <h1 v-text="projectName"></h1>
    <div class="sub-main-w3">
            <div class="vertical-tab">
        <div id="section1" class="section-w3ls">
          <input type="radio" name="sections" id="option1" checked="checked">
            <article>
              <form class="layui-form login-form" lay-filter="register">
                <div class="layui-form-item layui-form-text input">
                    <div class="layui-inline" >
                        <span style="margin-top: 8px;float: left">账户:</span>
                        <div class="layui-input-inline">
                            <input type="text" name="username" id="username"  placeholder="账户"  lay-verify="required" autocomplete="off" class="layui-input" style="width: 600px;">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text input">
                    <div class="layui-inline" >
                        <span style="margin-top: 8px;float: left">密码:</span>
                        <div class="layui-input-inline">
                            <input type="password" name="password" id="password1"  lay-verify="password1|required"   placeholder="密码" autocomplete="off" class="layui-input" style="width: 600px;">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text input">
                    <div class="layui-inline" >
                        <span style="margin-top: 8px;float: left">重复密码:</span>
                        <div class="layui-input-inline">
                            <input type="password" name="password2" id="password2"  lay-verify="password2|required"   placeholder="重复密码" autocomplete="off" class="layui-input" style="width: 600px;">
                        </div>
                    </div>
                </div>
                  <div class="layui-form-item layui-form-text input">
                    <div class="layui-inline" >
                        <span style="margin-top: 8px;float: left">姓名:</span>
                        <div class="layui-input-inline">
                            <input type="text" name="yonghuName" id="yonghuName"  placeholder="姓名"  lay-verify="required" autocomplete="off" class="layui-input" style="width: 600px;">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text input">
                    <div class="layui-inline" >
                        <span style="margin-top: 8px;float: left">性别:</span>
                        <div class="layui-input-inline">
                            <select name="sexTypes" id="sexTypes" lay-filter="sexTypes" style="width: 600px;">
                                <option v-for="item in sexTypesList" :value="item.codeIndex" :key="item.codeIndex">{{ item.indexName }}</option>
                            </select>
                        </div>
                    </div>
                </div>
<!-- 身份证号 -->
                <div class="layui-form-item layui-form-text input">
                    <div class="layui-inline" >
                        <span style="margin-top: 8px;float: left">身份证号:</span>
                        <div class="layui-input-inline">
                            <input type="text" name="yonghuIdNumber" id="yonghuIdNumber"  lay-verify="identity|required"   placeholder="身份证号" autocomplete="off" class="layui-input" style="width: 600px;">
                        </div>
                    </div>
                </div>
  <!-- 手机号 -->
                <div class="layui-form-item layui-form-text input">
                    <div class="layui-inline" >
                        <span style="margin-top: 8px;float: left">手机号:</span>
                        <div class="layui-input-inline">
                            <input type="text" name="yonghuPhone" id="yonghuPhone"  lay-verify="phone|required"   placeholder="手机号" autocomplete="off" class="layui-input" style="width: 600px;">
                        </div>
                    </div>
                </div>
                  <div class="layui-form-item" style="margin-bottom: 0;">
                  <div class="layui-input-block" style="margin-left: 0;">
                    <button class="layui-btn btn-submit btn submit" style="height: 50px;line-height: 25px;" lay-submit lay-filter="register">注册</button>
                  </div>
                </div>
                <a class="bottom-text-w3ls" href="javascript:window.location.href='../login/login.jsp'">已有账号？去登录</a>
              </form>
            </article>
          </div>
        </div>
        <div class="clear"></div>
      </div>
      <div class="copyright">
        <h2><a href="#"></a></h2>
      </div>
    </div>

  <script src="../../layui/layui.js"></script>
  <script src="../../js/vue.js"></script>
  <!-- 组件配置信息 -->
  <script src="../../js/config.js"></script>
  <!-- 扩展插件配置信息 -->
  <script src="../../modules/config.js"></script>
  <!-- 工具方法 -->
  <script src="../../js/utils.js"></script>
  <!-- 校验格式工具类 -->
  <script src="../../js/validate.js"></script>

  <script>
    var vue = new Vue({
      el: '#mian',
      data: {
        //字典表数据容器
        sexTypesList : [],
        projectName: projectName
      },
      updated: function() {
        layui.form.render(null, 'register');
      }
    });

    layui.use(['layer', 'element', 'carousel', 'form', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var carousel = layui.carousel;
      var form = layui.form;
      var http = layui.http;
      var jquery = layui.jquery;
      var tablename = http.getParam('tablename');



      // 查询字典表相关

        //字典表数据容器
        // 性别的查询和初始化
        sexTypesSelect();


      // 日期效验规则及格式
      dateTimePick();
      // 表单效验规则
      form.verify({
            // 正整数效验规则
            integer: [
                /^[1-9][0-9]*$/
                ,'必须是正整数'
            ]
            // 小数效验规则
            ,double: [
                /^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/
                ,'最大整数位为6为,小数最大两位'
            ]
            ,password1: function(value, item){ //value：表单的值、item：表单的DOM对象
                var password2 = jquery("#password2").val();
                if(password2 != null && password2 != "" && password2 != "null"){
                  if(value != password2){
                      return '密码的两次密码不一致';
                  }
                }
            }
            ,password2: function(value, item){ //value：表单的值、item：表单的DOM对象
                var password1 = jquery("#password1").val();
                if(password1 != null && password1 != "" && password1 != "null"){
                    if(value != password1){
                      return '密码的两次密码不一致';
                    }
                }
            }
      });


      // 注册
      form.on('submit(register)', function(data) {
        http.requestJson(tablename + '/register', 'post', data.field, function(res) {
            if(res.code==0){
                layer.msg('注册成功', {
                    time: 2000,
                    icon: 6
                },function(){
                    // 路径访问设置
                    window.location.href = '../login/login.jsp';
                });
            }else{
                layer.msg(res.msg);
                return false
            }

        });
        return false
      });




      // 日期框初始化
      function dateTimePick(){
      };

      // 性别的查询
      function sexTypesSelect() {
        //填充下拉框选项
          http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
              if(res.code == 0){
                vue.sexTypesList = res.data.list;
              }
          });
      }
});
  </script>
</body>
</html>
