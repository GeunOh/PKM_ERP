package com.my.ERP.Human.model.service;

import java.util.ArrayList;

import com.my.ERP.Human.model.vo.Human;
import com.my.ERP.common.vo.PageInfo;

public interface HumanService {

	int HumanListCount();

	ArrayList<Human> HumanList(PageInfo pi);

}
