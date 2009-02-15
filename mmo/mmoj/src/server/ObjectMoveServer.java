package server;

import java.net.Socket;
import java.net.ServerSocket;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.IOException;
import mmo.Game;


public class ObjectMoveServer {

	public static void main(String[] args) throws Exception {
		ServerSocket listener = new ServerSocket(5555);
        System.out.println("starting server");
        try {
        	int id = 0;
            while (true) {
                Game game = new Game();
                Game.Player playerX = game.new Player(listener.accept(),id++);
                //Game.Player playerO = game.new Player(listener.accept(), 'O');
                //playerX.setOpponent(playerO);
                //playerO.setOpponent(playerX);
                //game.currentPlayer = playerX;
                playerX.start();
                //playerO.start();
            }
        } finally {
            listener.close();
        }
		
	}
}
