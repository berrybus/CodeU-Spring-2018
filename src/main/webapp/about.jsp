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
<!DOCTYPE html>
<html>
<head>
  <title>Team 28 Chat App</title>
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
        <% if(request.getSession().getAttribute("user") != null){ %>
      <form action="/logout" method="POST">
      <button type="submit">logout</button>
    </form>
    <% } %>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>About the CodeU Chat App</h1>
      <p>
        This is a chat application designed to be a starting point
        for the CodeU project team work. Here's some stuff to think about:
      </p>

      <ul>
        <li><strong>Algorithms and data structures:</strong> We've made the app
            and the code as simple as possible. You will have to extend the
            existing data structures to support your enhancements to the app,
            and also make changes for performance and scalability as your app
            increases in complexity.</li>
        <li><strong>Look and feel:</strong> The focus of CodeU is on the Java
          side of things, but if you're particularly interested you might use
          HTML, CSS, and JavaScript to make the chat app prettier.</li>
        <li><strong>Customization:</strong> Think about a group you care about.
          What needs do they have? How could you help? Think about technical
          requirements, privacy concerns, and accessibility and
          internationalization.</li>
        <li><strong>Our Developers:</strong> We are a team of university students aiming 
          to improve our development skills by working with standard industry practices under the direction and aid of Google software engineers(P0).</li>
          <li><strong>Bold Text</strong> [b] TEXT HERE [/b]</li>
        <li><strong>Italicized Text</strong> [i]TEXT HERE [/i] </li>
        <li><strong>Underlined Text</strong> [u] TEXT HERE [/u] </li>
        <li><strong>Link</strong> [url] LINK HERE [/url]</li>
        <li><strong> Image </strong> [img] IMAGE LINK [/img]</li>
        <li><strong> Color Text </strong> [color = (input color here)] TEXT HERE [/color]</li>
        <li><strong> Font Size </strong> [size = (input size here)] TEXT HERE [/size]</li>
        <li><strong> Font Type </strong> [font = (input font here)] TEXT HERE [/font]</li>
        <li><strong> Alignment </strong> [align = (left, right, center)] TEXT HERE [/algin]</li>
      </ul>
    </div>
  </div>
</body>
</html>
