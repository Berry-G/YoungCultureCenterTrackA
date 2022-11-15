import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.youngtvjobs.ycc.member.InquiryDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class InquiryDummyDataTest {


	
	
			
//		@Autowired
//		private BoardDao boardDao;
//		@Test
//		public void insertDummyDataTest() throws Exception{
//			boardDao.deleteAll();
//			
//			for(int i = 1; i <= 250; i++) {
//				BoardDto boardDto= new BoardDto("Pioneering"+i, "Accion!"+i, "ezen");
//				boardDao.insert(boardDto);
//			}
}
