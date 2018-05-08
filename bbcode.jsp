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
    <a href="/bbcode.jsp">BB Code Key</a>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>BB Code Key</h1>
      <p>
        This is a key designed to help users style their text.
      </p>

      <ul>
        <li><strong>Bold Text</strong> [b] TEXT HERE [/b]</li>
        <li><strong>Italicized Text</strong> [i]TEXT HERE [/i] </li>
        <li><strong>Underlined Text</strong> [u] TEXT HERE [/u] </li>
        <li><strong>Link</strong> [url] LINK HERE [/url]</li>
        <li><strong> Image </strong> [img] IMAGE LINK [/img]</li>
      </ul>
    </div>
  </div>
</body>
</html>
