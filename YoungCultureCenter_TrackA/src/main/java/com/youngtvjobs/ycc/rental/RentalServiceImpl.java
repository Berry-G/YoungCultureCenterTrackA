package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	RentalDao rentalDao;

	@Override//대관 가능 시간 보여주는 기능
	public List<RentalDto> selectschedule() throws Exception {
		return rentalDao.selecttime();
	}
	
	@Override//날짜, 장소 선택하면 해당 장소 예약현황 보여주는 기능
	public List<RentalDto> viewRentalPlace() throws Exception {
		return rentalDao.selectview();
	}

	@Override//select에 DB에서 장소 값 넣는 기능 , 작동확인
	public List<RentalDto> selectRentalPlace() throws Exception {
		return rentalDao.select();
	}

	@Override//select, calender에서 선택한 값을 기반으로 하단 테이블에 보여주는 기능
	public List<RentalDto> getList(String croom_id, Date prental_de) throws Exception {
		List<RentalDto> list = null;
		list = rentalDao.selectAll(croom_id, prental_de);
		System.out.println("list = " + list);
		return list;
	}

	@Override
	public int rental(RentalDto rentalDto) throws Exception {
		return rentalDao.insertRentalinfo(rentalDto);
	}

	@Override
	public List<RentalDto> checkRental() throws Exception {
		return rentalDao.selectRental();
	}

	
	
	
}
	