package com.youngtvjobs.ycc.course;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	CourseDao courseDao;
	
	@Override
	public int getsearchResultCnt(CourseSearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.searchResultCnt(sc);
	}

	@Override
	public List<CourseDto> getsearchResultPage(CourseSearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.searchSelectPage(sc);
	}

	@Override
	public List<CourseDto> getPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.selectPage(map);
	}

	@Override
	public CourseDto readCourseDetail(Integer course_id) throws Exception {
		CourseDto courseDto = courseDao.courseDetail(course_id);
		
		return courseDto;
	}

	@Override
	public double avgReviewRating(Integer course_id) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.avgReviewRating(course_id);
	}

	@Override
	public int attendDuplicateCheck(Integer course_id, String user_id) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.attendDuplicateCheck(course_id, user_id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int attendInsert(AttendDto attendDto) throws Exception {
		courseDao.updateApplicantCnt(attendDto.getCourse_id(), 1);
		System.out.println(attendDto);
		
		return courseDao.attendInsert(attendDto);
	}

	@Override
	public int readAttendTable(Integer course_id, String user_id) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.selectAttendTable(course_id, user_id);
	}

	@Override
	public int courseWrite(CourseDto courseDto) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.insert(courseDto);
	}

	@Override
	public int courseRemove(Integer course_id) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.delete(course_id);
	}

	@Override
	public int coursemodify(CourseDto courseDto) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.update(courseDto);
	}

}
