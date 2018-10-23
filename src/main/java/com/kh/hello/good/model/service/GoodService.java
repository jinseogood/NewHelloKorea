package com.kh.hello.good.model.service;

import java.util.ArrayList;

import com.kh.hello.good.model.vo.Good;
import com.kh.hello.good.model.vo.Good2;

public interface GoodService {

	int selectOneDibs(Good gg);

	int insertDibsHotel(Good gg);

	int deleteDibsHotel(Good gg);

	int dibsCheckStatus(Good2 gg2);

	int insertDibsInfo(Good2 gg2);

	int deleteDibsInfo(Good2 gg2);

	ArrayList<Good2> dibsGradeInfo();


}
