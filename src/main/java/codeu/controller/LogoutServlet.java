// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;

import codeu.model.data.User;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import java.time.Instant;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.*;

/** Servlet class responsible for the login page. */
public class LogoutServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }


  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    request.getRequestDispatcher("/index.jsp").forward(request, response);
    request.getRequestDispatcher("/about.jsp").forward(request, response);
    request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
    request.getRequestDispatcher("/WEB-INF/view/chat.jsp").forward(request, response);
    request.getRequestDispatcher("/WEB-INF/view/conversations.jsp").forward(request, response);
    request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
  }

  /**
  * This function fires when a user submits the login form. It gets the username and password from
  * the submitted form data, checks that they're valid, and either adds the user to the session
  * so we know the user is logged in or shows an error to the user.
  */
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
        request.getSession().setAttribute("user", null);
        response.sendRedirect("/");
        return;
      }

}
