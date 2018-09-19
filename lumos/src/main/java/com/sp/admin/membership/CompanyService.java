package com.sp.admin.membership;

import java.util.List;
import java.util.Map;

public interface CompanyService {
	public int insertCompany(Company dto, String pathname);
	public List<Company> listCompany(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Company readCompany(int companyIndex);
	public Company readUpdateCompany(int companyIndex);
}
