<%
/*
    Να δημιουργήσετε το σενάριο create.jsp το οποίο χρησιμοποιείται για την δημιουργία μιας html φόρμας με δυναμικό τρόπο.
    Το create.jsp θα δέχεται με την μέθοδο post τον αριθμό μητρώου ενός σπουδαστή - το όνομα της παραμέτρου είναι studCode - καθώς
    και το πλήθος μαθημάτων- το όνομα της παραμέτρου ειναι noLessons. Το create.jsp θα εμφανίζει με έντονα γράμματα τον αριθμό μητρώου
    και θα δημιουργεί 2 πεδία κειμένου για το κάθε μάθημα, ανά γραμμή. Ο χρήστης της φόρμας θα μπορεί να γράψει στο πρώτο πεδίο, το κωδικό του μαθήματος και στο δεύτερο
    πεδίο την βαθμολογία στο αντίστοιχο μάθημα. Ο χρήστης της φόρμας δεν θα μπορεί να αλλάξει τον αριθμό μητρώου. Πατώντας το πλήκτρο αποστολή,
    τότε η φόρμα θα αποστέλλει όλα τα δεδομένα, τον αριθμό μητρώου, το πλήθος των μαθημάτων καθώς και τους κωδικούς και τις βαθμολογίες όλων των μαθημάτων, με
    τη μέθοδο post στο σενάριο savemarks.jsp
*/
//out.println("Hello World\n");
%>
<%-- 
    Document   : create
    Author     : kat.exe
--%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ΑΣΚΗΣΗ 6 </title>
    </head>
    <body>
        <form action="savemarks.jsp" method="post">
            <label for="studCode">Αριθμός Μητρώου: </label>
            <strong><%=request.getParameter("studCode")%> </strong><br><br>
            <label for="noLessons">Αριθμός Mαθημάτων: </label>
            <strong><%=request.getParameter("noLessons")%> </strong><br><br>
            
                <table style="width:100%">
                    <tr>
                    <th>Κωδικός</th>
                    <th>Βαθμολογία</th>
                    </tr>
                <% 
                    String studCode= request.getParameter("studCode");
                    session.setAttribute("studCode", studCode);
                    String noLessons= request.getParameter("noLessons");
                    session.setAttribute("noLessons", noLessons);
                    try{
                        int lessons= Integer.parseInt(noLessons);
                        String valuesCode[] = new String[lessons];
                        String valuesDegree[] = new String[lessons];
                        for(int i=0; i<lessons; i++){
                    
                    
                %>

                    <tr>
                    <th>Μάθημα <%=i+1 %>
                    <input type="text" name="lesson<%= i %>" ></th>
                    <th><input type="text" name="grade<%= i %>" ></th>
                    </tr>
                    
                
                
                <%
                        } 
                        %>
                    </table>
                    <%
                        
                    }
                    catch(NumberFormatException ex){
                        ex.printStackTrace();
                    }
                %>
        <input type="submit" value="submit">
        </form>

    </body>