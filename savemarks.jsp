<%
    /*
        Να δημιουργήσετε το σενάριο savemarks.jsp το οποίο χρησιμοποιείται για την αποθήκευση
        των δεδομένων που αποστέλλει το σενάριο create.jsp. Το savemarks.jsp θα δημιουργεί ένα αρχείο
        που θα έχει σαν όνομα τον αριθμό μητρώου του σπουδαστή με κατάληξη ".txt" και στο αρχείο θα υπάρχει στην
        πρώτη γραμμή το πλήθος των μαθημάτων και στην συνέχεια θα περιέχει ανά γραμμή το κωδικό του μαθήματος,
        ένα κενό, και το βαθμό στο αντίστοιχο μάθημα. Σε περίπτωση επιτυχίας θα γράφει το μήνυμα "Το αρχείο αποθηκεύτηκε με επιτυχία" και σε
        περίπτωση σφάλματος θα γράφει "Έχει συμβεί ένα σφάλμα".
        Τα περιεχόμενα του αρχείου cs1254.txt αν το savemarks.jsp παραλάβει σαν αριθμό μητρώου το cs1254
        σαν πλήθος μαθημάτων το 3, και τους κωδικούς των μαθημάτων Χ1 και Χ2 και Χ3 με τις αντίστοιχες βαθμολογίες τους 7.5 και 4.5 και 6.
    */
%>
<%-- 
    Document   : savemarks
    Author     : kat.exe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ΑΣΚΗΣΗ 7</title>
    </head>
    <body>
        <%

            String lessons=(String)session.getAttribute("noLessons");
            String ArithmosMitroou=(String)session.getAttribute("studCode");

            try{
                int numberOfLessons= Integer.parseInt(lessons);
                String[] valuesCode = new String[numberOfLessons];
                String[] valuesGrade= new String[numberOfLessons];

                for(int i=0; i<numberOfLessons; i++)
                {
                    String codeLesson= request.getParameter("lesson"+i);
                    String grade= request.getParameter("grade"+i);
                    valuesCode[i]=codeLesson;
                    valuesGrade[i]=grade;
                    
                }
                double mesosoros=0;
                for(int i=0; i<numberOfLessons; i++)
                {
                    double d=Double.parseDouble(valuesGrade[i]);
                    mesosoros=d+mesosoros;
                }
                mesosoros=mesosoros/numberOfLessons;
                //To συγκεκριμένο dir
                String dir = System.getProperty("user.dir");
                File directory= new File(dir);
                out.println("To μονοπάτι είναι "+dir+"\n");%>
                <br></br>
                <%
                File file= new File(ArithmosMitroou+".txt");
                //Ελέγχουμε αν το αρχείο υπήρχε από πρίν
                if (file.createNewFile()) {
                    out.println("File created: " + file.getName());%>
                    <br></br>
                <%
                } else {
                    out.println("File already exists.");%>
                    <br></br>
                    <%
                }
                FileWriter Write = new FileWriter(file.getName());
                Write.write(numberOfLessons+"\n");
                for(int i=0; i<numberOfLessons; i++)
                {
                    Write.write("X"+(i+1)+" "+valuesGrade[i]+"\n");
                    
                }
                    Write.write("Ο Μέσος Όρος είναι "+mesosoros+"\n");
                Write.close();
                out.println("Έγινε με επιτυχία η εγγραφή.\n");%>
                <br></br>
                <%

            }catch(NumberFormatException ex){
                out.println("Έγινε με αποτυχία η εγγραφή.\n");
                ex.printStackTrace();

            }
        %>
    </body>
</html>
