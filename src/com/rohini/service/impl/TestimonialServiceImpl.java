package com.rohini.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rohini.beans.TestimonialBean;
import com.rohini.service.TestimonialService;
import com.rohini.utility.DBUtil;

public class TestimonialServiceImpl implements TestimonialService {


	@Override
	public boolean addTestimonial(TestimonialBean testimonial) {
		boolean flag = false;

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;

		try {
			String query = "INSERT INTO testimonials (name, mail, message) VALUES (?, ?, ?)";
		    ps = con.prepareStatement(query);

		    // Assuming testimonial.getName(), testimonial.getMail(), and testimonial.getMessage() return the actual values
		    String name = testimonial.getName();
		    String mail = testimonial.getMail();
		    String message = testimonial.getMessage();

		    ps.setString(1, name);
		    ps.setString(2, mail);
		    ps.setString(3, message);

			int k = ps.executeUpdate();

			if (k > 0)
				flag = true;

		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}

		return flag;
	}

	@Override
	public List<TestimonialBean> getAllTestimonials() {
		List<TestimonialBean> testimonialList = new ArrayList<TestimonialBean>();

		Connection con = DBUtil.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from testimonials");

			rs = ps.executeQuery();

			while (rs.next()) {

				TestimonialBean test = new TestimonialBean(rs.getString("name"), rs.getString("mail"), rs.getString("message"));

				testimonialList.add(test);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return testimonialList;
	}
	

}
