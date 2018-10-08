package com.sp.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("main.mainService")
public class MainServiceImpl implements MainService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Slide> conSlideBanner() {
		List<Slide> list = null;
		try {
			list=dao.selectList("usermain.conSlideBanner");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Slide> exSlideBanner() {
		List<Slide> list = null;
		try {
			list=dao.selectList("usermain.exSlideBanner");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<MainBbs> mainEvtList() {
		List<MainBbs> list = null;
		try {
			list=dao.selectList("usermain.mainEvtList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<MainBbs> mainNtcList() {
		List<MainBbs> list = null;
		try {
			list=dao.selectList("usermain.mainNtcList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
