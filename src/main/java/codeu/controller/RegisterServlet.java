package codeu.controller;
import java.io.IOException;
import java.util.UUID;
import java.time.Instant;
import java.lang.String;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import codeu.model.data.User;
import codeu.model.store.basic.UserStore;
import org.mindrot.jbcrypt.*;

/**
* Servlet class responsible for user registration.
*/
public class RegisterServlet extends HttpServlet {

  //Check for usernames that are already stored (P5)
      //Part 5 - User Store Class added to backend
  /**
  * Store class that gives access to Users.
  */
  private UserStore userStore;

  /**
  * Set up state for handling registration-related requests. This method is only called when
  * running in a server, not when running in a test.
  */
 @Override
 public void init() throws ServletException {
   super.init();
   setUserStore(UserStore.getInstance());
 }
 
 /**
  * Sets the UserStore used by this servlet. This function provides a common setup method
  * for use by the test framework or the servlet's init() function.
  */
 void setUserStore(UserStore userStore) {
   this.userStore = userStore;
 }

 //End Part 5


 @Override
 public void doGet(HttpServletRequest request, HttpServletResponse response)
     throws IOException, ServletException {

   //response.getWriter().println("<h1>RegisterServlet GET request.</h1>");
   //Changed Section
   request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
   //END Changed Section  	

   //PART % - HANDLES POST RESPONSE AFTER SUBMITTING REGISTRATION
 }

 @Override
 public void doPost(HttpServletRequest request, HttpServletResponse response)
     throws IOException, ServletException {

   String username = request.getParameter("username");
   String password = request.getParameter("password");
   // Use JBCript to generate pw hash
   String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());

   //Error Checking for non-Alphanumeric Characters
   //Errors will be sent to register.jsp

   if (!username.matches("[\\w*\\s*]*")) {
     request.setAttribute("error", "Please enter only letters, numbers, and spaces.");
     request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
     return;
   }

   //END Error Checking


   if (userStore.isUserRegistered(username)) {
     request.setAttribute("error", "That username is already taken.");
     request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
     return;
   }

   //End check and add user if valid. Redirects to login page

   User user = new User(UUID.randomUUID(), username, passwordHash, Instant.now());
   userStore.addUser(user);

   response.sendRedirect("/login");

   //The code below is only for testing purposes (returns typed user and pass)
   /*
   response.getWriter().println("<p>Username: " + username + "</p>");
   response.getWriter().println("<p>Password: " + password + "</p>");
   */ 
 }
}



