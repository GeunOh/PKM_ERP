package com.my.ERP.Human.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.ERP.Human.model.dao.HumanDAO;

@Service("hService")
public class HumanServiceImpl implements HumanService {
	
	@Autowired
	private HumanDAO hDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
