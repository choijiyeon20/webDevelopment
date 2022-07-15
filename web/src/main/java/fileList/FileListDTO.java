package fileList;

public class FileListDTO {
	private int file_num;
	private int post_num;
	private String file_name;
	private String path;
	private int file_size;
	private String sub_date;
	private String submit_id;
	
	public FileListDTO() {
	}
	
	public FileListDTO(int file_num, int post_num, String file_name, String path, int file_size, String sub_date,
			String submit_id) {
		super();
		this.file_num = file_num;
		this.post_num = post_num;
		this.file_name = file_name;
		this.path = path;
		this.file_size = file_size;
		this.sub_date = sub_date;
		this.submit_id = submit_id;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public String getSub_date() {
		return sub_date;
	}

	public void setSub_date(String sub_date) {
		this.sub_date = sub_date;
	}

	public String getSubmit_id() {
		return submit_id;
	}

	public void setSubmit_id(String submit_id) {
		this.submit_id = submit_id;
	}
}
