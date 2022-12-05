package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface RentalDao {
	
	List<RentalDto> selecttime() throws Exception;
	List<RentalDto> select() throws Exception;
	List<RentalDto> selectview() throws Exception;
	List<RentalDto> selectAll(String croom_id, Date prental_de) throws Exception;
	List<RentalDto> selectRental() throws Exception;

	int insertRentalinfo(RentalDto dto)throws Exception;	//예약하는 insert 로직
	
}
