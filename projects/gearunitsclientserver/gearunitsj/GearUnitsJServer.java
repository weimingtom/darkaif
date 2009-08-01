package gearunitsj;


import gearunitsj.Game.*;

import java.net.Socket;
import java.net.ServerSocket;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.IOException;



public class GearUnitsJServer {
	
	public static void main(String[] args) throws Exception {
		ServerSocket listener = new ServerSocket(5555);
        System.out.println("starting server...");
        try {
        	int id = 0;
        	Game game = new Game();
        	game.start();
            while (true) {
                Game.Player playerX = game.new Player(listener.accept(),id++);
                playerX.start();
                Game.list.add(playerX);
            }
        } finally {
            listener.close();
        }
		
	}
}
