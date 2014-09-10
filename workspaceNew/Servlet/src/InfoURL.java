import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoURL extends HttpServlet
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Informations sur URL</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("nom du serveur (getServerName) : ");
            out.println(request.getServerName());
            out.println("<br>");
            out.println("numero de port du serveur (getServerPort) : ");
            out.println(request.getServerPort());
            out.println("<br>");
            out.println("nom de l'application sur le serveur (getContextPath) : ");
            out.println(request.getContextPath());
            out.println("<br>");
            out.println("identification de la servlet (getServletPath) : ");
            out.println(request.getServletPath());
            out.println("<br>");
            out.println("methode http (getMethod) : ");
            out.println(request.getMethod());
            out.println("<br>");
            out.println("les paramètres passé dans la requête (getQueryString) : ");
            out.println(request.getQueryString());
            out.println("<br>");
            out.println("l'URL complète (getRequestURL) : ");
            out.println(request.getRequestURL());
            out.println("<br>");
            out.println("adresse IP du serveur (getLocalAddr) : ");
            out.println(request.getLocalAddr());
            out.println("<br>");
            out.println("nom du serveur (getLocalName) : ");
            out.println(request.getLocalName());
            out.println("<br>");
            out.println("port de reception de la requête (getLocalPort) : ");
            out.println(request.getLocalPort());
            out.println("<br>");
            out.println("adresse IP du client (getRemoteAddr) : ");
            out.println(request.getRemoteAddr());
            out.println("<br>");
            out.println("nom de la machine client (getRemoteHost) : ");
            out.println(request.getRemoteHost());
            out.println("<br>");
            out.println("</body>");
            out.println("</html>");
            
        }
        finally
        {
            out.close();
        }
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}

