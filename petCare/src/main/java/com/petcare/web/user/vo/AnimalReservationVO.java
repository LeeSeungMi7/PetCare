package com.petcare.web.user.vo;

import lombok.Data;

@Data
public class AnimalReservationVO {
	private int animal_num;
	private int reservation_num;

	public AnimalReservationVO(int animal_num, int reservation_num) {
		this.animal_num = animal_num;
		this.reservation_num = reservation_num;
	}

}
