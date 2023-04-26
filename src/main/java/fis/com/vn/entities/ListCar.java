package fis.com.vn.entities;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ListCar {

	ArrayList<Car> cars;

	public void add(Car car) {
		if (cars == null)
			cars = new ArrayList<>();
		cars.add(car);
	}
}
