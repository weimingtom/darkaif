

package test;

/**
 *
 * @author kris@neuroproductions.be
 */
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class HelloWorld extends JPanel implements ActionListener
{

  
    JButton buttonConnect;
    JButton buttonSend;

    JTextField port_txt;
    JTextField message_txt;
    JTextArea status_txt;
    
    PrintWriter out;

    public HelloWorld()
    {
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
        status_txt =new JTextArea("Status");

        status_txt.setPreferredSize(new Dimension(250, 100));
        add(status_txt);
        port_txt =new JTextField("5555");
       port_txt.setMaximumSize(new Dimension(250, 25));
        add(port_txt);
        buttonConnect = new JButton("connect");
        buttonConnect.addActionListener(this);
        buttonConnect.setActionCommand("connect");

        add(buttonConnect);

        message_txt=new JTextField("type your message");
        message_txt.setMaximumSize(new Dimension(250, 25));
         add(message_txt);
        buttonSend = new JButton("Push");
        buttonSend.addActionListener(this);
        buttonSend.setActionCommand("push");
         add(  buttonSend);

    }
    public void actionPerformed(ActionEvent event)
    {
        String aCommand = event.getActionCommand();
        if (aCommand.equals( "connect"))
        {
            setStatus("waiting for client");
           try
           {
                connect( port_txt.getText());
           }
           catch (IOException e)
           {
                System.out.println("Accept failed");
           }

        }
        if (aCommand.equals( "push"))
        {

            send(message_txt.getText());


        }
    }


     private void connect(String port)throws IOException
    {
        ServerSocket serverSocket = null;

        try
        {
             serverSocket = new ServerSocket(Integer.valueOf( port ).intValue());
        }
        catch (IOException e)
        {

            System.out.println("mislukt");

        }

        Socket clientSocket = null;
        try
        {
            clientSocket = serverSocket.accept();
        }
        catch (IOException e)
        {
            System.out.println("Accept failed");


        }
        // say hello to flash
        out = new PrintWriter(clientSocket.getOutputStream(), true);
        out.println("Hello Flash");
        setStatus("Sending Handshake: Hello Flash") ;
        BufferedReader in = new BufferedReader(
		new InputStreamReader(clientSocket.getInputStream()));
        String inputLine;

    }

    public void send(String message)
    {
        setStatus("pushing : "+message ) ;
        out.println(message);
    }




    private void setStatus(String status)
    {

        status_txt.setText( status_txt.getText()+"\n" +status);
    }
    private static void createAndShowGUI()
    {
       
        JFrame frame = new JFrame("Socket Test");
       
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

       
        HelloWorld newContentPane = new HelloWorld();
        
        newContentPane.setOpaque(true);
        frame.setContentPane(newContentPane);

        frame.setSize(500,500);
        //  frame.pack();
        frame.setVisible(true);
    }

    public static void main(String[] args)
    {
       
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });
    }

}
