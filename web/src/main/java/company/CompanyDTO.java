package company;

public class CompanyDTO {
	private int company_num;
	private String company_name;
	private String company_explanation;

	public CompanyDTO() {
	}
	public CompanyDTO(int company_num, String company_name, String company_explanation) {
		super();
		this.company_num = company_num;
		this.company_name = company_name;
		this.company_explanation = company_explanation;
	}
	public int getCompany_num() {
		return company_num;
	}
	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_explanation() {
		return company_explanation;
	}
	public void setCompany_explanation(String company_explanation) {
		this.company_explanation = company_explanation;
	}
	
	
}
