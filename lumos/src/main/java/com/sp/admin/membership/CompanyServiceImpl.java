package com.sp.admin.membership;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("membership.companyService")
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertCompany(Company dto, String pathname) {
		int result=0;
		try {
			result = dao.insertData("membership.insertCompany", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Company> listCompany(Map<String, Object> map) {
		List<Company> list = null;
		
		try {
			list = dao.selectList("membership.listCompany", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("membership.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Company readCompany(int companyIndex) {
		Company dto = null;
		
		try {
			dto=dao.selectOne("membership.readCompany", companyIndex);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Company readUpdateCompany(int companyIndex) {
		Company dto=null;
		try {
			dto=dao.selectOne("membership.readCompany", companyIndex);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
}
