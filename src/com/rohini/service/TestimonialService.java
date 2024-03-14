package com.rohini.service;

import java.util.List;

import com.rohini.beans.TestimonialBean;

public interface TestimonialService {

	public boolean addTestimonial(TestimonialBean order);

	public List<TestimonialBean> getAllTestimonials();
}
