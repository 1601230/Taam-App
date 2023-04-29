package WebServer;

import Core.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.SQLException;
import java.util.*;

public class WebServer {
    private static final int PORT = 8080; // port to listen to

    public void start() {
        try {
            ServerSocket serverConnect = new ServerSocket(PORT);
            System.out.println("Server started.\nListening for connections on port : " + PORT + " ...\n");
            // we listen until user halts server execution
            while (true) {
                // each client connection will be managed in a dedicated Thread
                new SocketThread(serverConnect.accept());
                // create dedicated thread to manage the client connection
            }
        } catch (IOException e) {
            System.err.println("Server Connection error : " + e.getMessage());
        }
    }

    private class SocketThread extends Thread {
        // SocketThread sees WebServer attributes
        private final Socket insocked;
        // Client Connection via Socket Class

        SocketThread(Socket insocket) {
            this.insocked = insocket;
            this.start();
        }

        @Override
        public void run() {
            // we manage our particular client connection
            BufferedReader in;
            PrintWriter out;
            String resource;

            try {
                // we read characters from the client via input stream on the socket
                in = new BufferedReader(new InputStreamReader(insocked.getInputStream()));
                // we get character output stream to client
                out = new PrintWriter(insocked.getOutputStream());
                // get first line of the request from the client
                String input = in.readLine();
                // we parse the request with a string tokenizer

                System.out.println("sockedthread : " + input);

                StringTokenizer parse = new StringTokenizer(input);
                String method = parse.nextToken().toUpperCase();
                // we get the HTTP method of the client
                if (!method.equals("GET")) {
                    System.out.println("501 Not Implemented : " + method + " method.");
                } else {
                    // what comes after "localhost:8080"
                    resource = parse.nextToken();
                    System.out.println("input " + input);
                    System.out.println("method " + method);
                    System.out.println("resource " + resource);

                    parse = new StringTokenizer(resource, "/[?]=&");
                    int i = 0;
                    String[] tokens = new String[20];
                    // more than the actual number of parameters
                    while (parse.hasMoreTokens()) {
                        tokens[i] = parse.nextToken();
                        System.out.println("token " + i + "=" + tokens[i]);
                        i++;
                    }

                    // Make the answer as a JSON string, to be sent to the Javascript client
                    String answer = makeHeaderAnswer() + makeBodyAnswer(tokens);
                    System.out.println("answer\n" + answer);
                    // Here we send the response to the client
                    out.println(answer);
                    out.flush(); // flush character output stream buffer
                }

                in.close();
                out.close();
                insocked.close(); // we close socket connection
            } catch (Exception e) {
                System.err.println("Exception : " + e);
            }
        }

        private Map<String,Object> makeBodyAnswer(String[] tokens) throws SQLException {
            int counter = 0;
            Map<String, Object> result = null;

            while (!tokens[counter].equals("end"))
            {
                switch(tokens[counter])
                {
                    case "restrictions":
                        String token = tokens[counter + 1];
                        Taam_App.getInstance().setRestrictions(token);
                        result = Taam_App.getInstance().recommendedProducts();
                        counter = counter + 2;
                        break;

                    case "language":
                        String language = tokens[counter + 1];
                        Taam_App.getInstance().setLanguage(language);
                        counter = counter + 2;
                        break;

                    case "restrictionsList":
                        result = Taam_App.getInstance().getRestrictionsList();
                        counter = counter + 1;
                        break;

                    case "barcode":
                        String barcode = tokens[counter + 1];
                        result = Taam_App.getInstance().checkProductBarcode(barcode);
                        counter = counter + 2;
                        break;

                    case "name":
                        String name = tokens[counter + 1];
                        result = Taam_App.getInstance().checkProductIngredientName(name);
                        counter = counter + 2;
                        break;

                    case "notFound":
                        Taam_App.getInstance().notFound();
                        counter = counter + 1;
                        break;

                    case "incident":
                        String observation = tokens[counter + 1];
                        Taam_App.getInstance().incident(observation);
                        counter = counter + 2;
                        break;

                    case "refresh":
                        result = Taam_App.getInstance().refreshRecommendedProducts();
                        counter = counter + 1;
                        break;

                    case "getQuestions":
                        counter = counter + 1;
                        //break;
                        return null;

                    case "getAnswer":
                        counter = counter + 2;
                        //break;
                        return null;

                    case "sendQuestion":
                        counter = counter + 2;
                        //break;
                        return null;
                        
                    default:
                        return null;
                }
            }
            return result;
        }

        private String makeHeaderAnswer() {
            String answer = "";
            answer += "HTTP/1.0 200 OK\r\n";
            answer += "Content-type: application/json\r\n";
            //answer += "Access-Control-Allow-Origin: *\r\n";
            // IMPORTANT: you may need to uncomment the preceding
            // sentence in order to avoid the CORS error :
            // "Cross-Origin Request Blocked: The Same Origin
            // Policy disallows reading the remote resource..."
            answer += "\r\n";
            // blank line between headers and content, very
            // important !
            return answer;
        }
    } // SocketThread

} // WebServer