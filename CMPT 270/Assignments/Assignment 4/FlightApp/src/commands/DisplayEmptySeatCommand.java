package commands;

import containers.FlightDictionary;
import entities.Flight;

/**
 * A class which handles the displaying of any empty
 * seats on a flight.
 * @author Matthew Mulenga
 *
 */
public class DisplayEmptySeatCommand extends CommandStatus {
	
	//-------- Instance Variables --------
	/**
	 * A string which stores the list of given seats.
	 */
	private String availableSeatString;
	
	//-------- Methods --------
	/**
	 * A method which determines which seat are empty.
	 * @precond f != null
	 * @param number
	 */
	public void emptySeat(int number) {
		Flight f = FlightDictionary.dictionary().get(number);
		
		try {
			if(f == null) {
				throw new RuntimeException("There is no flight with number " + number);
			} else {
				availableSeatString = f.availableSeats();
				successful = true;
			}
		}
		catch(RuntimeException e) {
			successful = false;
			errorMessage = e.getMessage();
		}
	}
	
	public String getAvailableSeatString() {
		return availableSeatString;
	}
	
	
	
	//-------- Testing --------
	public static void main(String[] args) {
		System.out.println("Testing DisplayEmptySeatCommand class");
		
		DisplayEmptySeatCommand command = new DisplayEmptySeatCommand();
		Flight f = new Flight(320, 3, 30);
		FlightDictionary.dictionary().put(320, f);
		int testFailed = 0;
		
		try {
			command.emptySeat(f.getNumber());
			if(command.availableSeatString == null) {
				testFailed++;
				throw new RuntimeException("Something is wrong with the emptySeat or getAvailableSeatString methods.");
			}

		} catch(RuntimeException e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("Number of tests failed: " + testFailed);
	}
}