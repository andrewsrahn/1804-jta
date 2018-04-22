package com.revature.menus;

import java.util.InputMismatchException;
import java.util.NoSuchElementException;
import java.util.Scanner;

import com.revature.singletons.LogThis;
import com.revature.users.Person;
import com.revature.users.Student;

public class StudentMenu {

	public static void studentMenu(Student student) {

		if (student.isApproved()) {
			System.out.println("Your account has not been approved by your teacher.");
			System.out.println("Please try to login again later.");
		} else if (student.isLocked()) {
			System.out.println("Your account has been locked.");
			System.out.println("Please talk to your teacher.");
		} else {
			LogThis.info("Student Menu");
			System.out.println("Your options are:");
			System.out.println("You have " + student.getCoins() + " coins!");
			System.out.println("1. Earn more coins by completing arithmetic problems");
			System.out.println("2. Buy more arithmetic problems with your coins");
			System.out.println("0. Logout");
		}
		
		Scanner sc = new Scanner(System.in);

		try {
			while (true) {
				int choice = sc.nextInt();
				switch (choice) {
				case 1:
					break;
				case 2:
					break;
				case 0:
					Person.logout(student);
				default:
					LogThis.info("Invalid Choice");
					System.out.println("Your options are:");
					System.out.println("You have " + student.getCoins() + " coins!");
					System.out.println("1. Earn more coins by completing arithmetic problems");
					System.out.println("2. Buy more arithmetic problems with your coins");
					System.out.println("0. Logout");
					break;
				}
			}
		} catch (InputMismatchException ime) {
			LogThis.warn(ime.getMessage());
		} catch (NoSuchElementException nsee) {
			LogThis.warn(nsee.getMessage());
		} catch (IllegalStateException ise) {
			LogThis.warn(ise.getMessage());
		} finally {
			sc.close();
		}

	}

}
