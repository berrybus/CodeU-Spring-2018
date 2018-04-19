<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.Instant" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.User" %>
<%
//user that has their profile page being displayed
User profile = (User) request.getAttribute("profile");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>


<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">Galehaut</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <div id="container">

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <h1><%= profile.getName() %>'s Profile Page</h1>
    <hr/>
    <h2> About <%= profile.getName() %> </h2>
    <%= profile.getAboutMe() %>

    <!-- check if the user is on their own page -->
    <% if(profile.getName().equals(request.getSession().getAttribute("user"))) { %>
    <h3> Edit your About Me (only you can see this) </h3>
    <form action="/user/<%= profile.getName() %>" method="POST">
        <textarea name="aboutMe" rows="5" cols="100"></textarea>
        <br>
        <button type="submit">Submit</button>
    </form>
    <% } %>

    <h2> <%= profile.getName() %>'s Sent Messages </h2>

    <div id="user_messages">
      <ul>
    <%
      for (Message message : messages) {
        Instant time = message.getCreationTime();
    %>
      <li><strong><%= time %>:</strong> <%= message.getProcessedContent() %></li>
    <%
      }
    %>
      </ul>
    </div>


  </div>
</body>
</html>
