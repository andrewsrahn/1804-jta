package com.main.application;

import com.bank.exception.UserNotFoundException;
import com.bank.mainmenu.MainMenu;

public class Application 
{	
	public static void main(String[] args) throws UserNotFoundException{
		MainMenu.startMenu();
	}
}


