package containers;

import java.util.TreeMap;
import entities.Passenger;

public class PassengerContainer {

	private PassengerContainer() {}

	private static TreeMap<String, Passenger> dictionary;
	
	public static TreeMap<String, Passenger> dictionary() {
		if(dictionary == null) {
			dictionary = new TreeMap<String, Passenger>();
		}
		
		return dictionary;
	}
}
