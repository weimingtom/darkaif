/*
 * ChatServerConnection.java
 *
 * This file is part of a tutorial on making a chat application using Flash
 * for the clients and Java for the multi-client server.
 * 
 * View the tutorial at http://www.broculos.net/
 */

package chatserver;

import java.net.*;
import java.io.*;

/**
 * The ChatServerConnection handles individual client connections to the chat server.
 *
 * @author Nuno Freitas (nunofreitas@gmail.com)
 */
public class ChatServerConnection extends Thread {
    protected Socket socket;
    protected BufferedReader socketIn;
    protected PrintWriter socketOut;
    protected ChatServer server;
    
    /*
     * Creates a new instance of ChatServerConnection.
     *
     * @param socket the client's socket connection
     * @param server the server to each the client is connected
     **/
    public ChatServerConnection(Socket socket, ChatServer server) {
        this.socket = socket;
        this.server = server;
    }
    
    /**
     * Gets the remote address of the client.
     *
     * @return the socket address of the client connection
     */
    public SocketAddress getRemoteAddress() {
        return this.socket.getRemoteSocketAddress();
    }

    /**
     * Roots a debug message to the main application.
     * 
     * @param msg The debug message to be sent to the main application
     */
    protected void debug(String msg) {
        Main.debug("ChatServerConnection (" + this.socket.getRemoteSocketAddress() + ")", msg);
    }
    
    /**
     * Waits from messages from the client and then instructs the server to send the messages to all clients.
     */
    public void run() {
        try {
            this.socketIn = new BufferedReader(new InputStreamReader(this.socket.getInputStream()));
            this.socketOut = new PrintWriter(this.socket.getOutputStream(), true);
            this.server.writeToAll(this.getRemoteAddress() + " has connected.");
            String line = this.socketIn.readLine();

            while (line != null) {
                debug("client says '" + line + "'");
                
                // If it's a quit command, we remove the client from the server and exit
                if (line.compareToIgnoreCase("\\quit") == 0) {
                    if (this.server.remove(this.getRemoteAddress())) {
                        this.finalize();
                        return;
                    }
                }
                this.server.writeToAll(this.getRemoteAddress() + ": " + line);
                line = this.socketIn.readLine();
            }
        }
        catch (Exception e) {
            debug("Exception (run): " + e.getMessage());
        }
    }
    
    /**
     * Sends a message to the connected party.
     *
     * @param msg the message to send
     */
    public void write(String msg) {
        try {
            this.socketOut.write(msg + "\u0000");
            this.socketOut.flush();
        }
        catch (Exception e) {
            debug("Exception (write): " + e.getMessage());
        }
    }

    /**
     * Closes the reader, the writer and the socket.
     */
    protected void finalize() {	 
        try {
            this.socketIn.close(); 
            this.socketOut.close();
            this.socket.close();
            debug("connection closed");
        }
        catch (Exception e) {
            debug("Exception (finalize): " + e.getMessage());
        }
    }
}