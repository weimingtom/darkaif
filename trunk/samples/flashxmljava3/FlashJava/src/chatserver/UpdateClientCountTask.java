/*
 * UpdateClientCountTask.java
 *
 * This file is part of a tutorial on making a chat application using Flash
 * for the clients and Java for the multi-client server.
 * 
 * View the tutorial at http://www.broculos.net/
 */

package chatserver;

import java.util.*;
import javax.swing.*;

/**
 * UpdateClientCountTask is a task for updating a label with information about the number of connected clients.
 *
 * @author Nuno Freitas (nunofreitas@gmail.com)
 */
public class UpdateClientCountTask extends TimerTask {
    protected JLabel clientsLabel;
    protected ChatServer chatServer;

    /**
     * Creates a new instance of UpdateClientCountTask.
     *
     * @param chatServer the chat server
     * @param clientsLabel the label to be updated
     */
    public UpdateClientCountTask(ChatServer chatServer, JLabel clientsLabel) {
        this.chatServer = chatServer;
        this.clientsLabel = clientsLabel;
    }
    
    /**
     * Updates the label with the number of connected clients.
     */
    public void run() {
        int count = this.chatServer.getClientCount();
        String msg = count + " client" + ((count != 1) ? "s" : "");
        this.clientsLabel.setText(msg);
    }   
}
