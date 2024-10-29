<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>登录</title>
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
            <form class="layui-form login-form">
              <div class="layui-form-item layui-form-text input">
                  <span style="margin-top: 8px;float: left">账户:</span>
                <div class="layui-input-inline">
                  <input type="text" name="username"  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input"  style="width: 500px;">
                </div>
              </div>
              <div class="layui-form-item input">
                  <span style="margin-top: 8px;float: left">密码:</span>
                <div class="layui-input-inline" >
                  <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"  style="width: 500px;">
                </div>
              </div>
              <div class="layui-form-item input">
                <div class="layui-input-block" style="text-align: left;margin-left: 0;">
                  <input type="radio" name="role"  value="yonghu" title="用户">
                </div>
              </div>
              <div class="layui-form-item" style="margin-bottom: 0;">
                <div class="layui-input-block" style="margin-left: 0;">
                  <button class="layui-btn btn-submit btn submit" style="height: 50px;line-height: 25px;" lay-submit lay-filter="login">登录</button>
                </div>
              </div>
              <a class="bottom-text-w3ls" href="javascript:registerClick('yonghu')">注册用户</a>
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

  <script>
    var vue = new Vue({
      el: '#mian',
      data: {
        menu: menu,
        projectName: projectName
      },
      methods: {
        jump(url) {
          jump(url)
        }
      }
    });

    layui.use(['layer', 'element', 'carousel', 'form', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var carousel = layui.carousel;
      var form = layui.form;
      var http = layui.http;
      var jquery = layui.jquery;

      // 登录
      form.on('submit(login)', function(data) {
          var attr = jquery("input[name='role']:checked").attr('title');
          debugger
        data = data.field;
        if (!data.role) {
          layer.msg('请选择登录用户类型', {
            time: 2000,
            icon: 5
          });
          return false;
        }
        http.request(data.role + '/login', 'get', data, function(res) {
          layer.msg('登录成功', {
            time: 2000,
            icon: 6
          });
          // 登录凭证
          localStorage.setItem('Token', res.token);
          debugger
          localStorage.setItem('role', jquery("input[name='role']:checked").attr('title'));
          // 当前登录用户角色
          localStorage.setItem('userTable', data.role);
          localStorage.setItem('sessionTable', data.role);
          // 用户名称
          localStorage.setItem('adminName', data.username);
          http.request(data.role + '/session', 'get', {}, function(res) {
            // 用户id
            localStorage.setItem('userid', res.data.id);
            // 路径访问设置
            window.location.href = '../../index.jsp';
          })
          
        });
        return false
      });

    });

    /**
      * 跳转登录
      * @param {Object} tablename
      */
    function registerClick(tablename) {
      window.location.href = '../' + tablename + '/register.jsp?tablename=' + tablename;
    }
  </script>

</body>

</html>