package fileBoard;

public class FileBoardDTO {
	private int post_num;
	private String writer;
	private String title;
	private String content;
	private String write_date;
	private String deadline;
	private String file_name;
	private String path;
	private int file_size;
	
	public FileBoardDTO() {
		
	}

	public FileBoardDTO(int post_num, String writer, String title, String content, String write_date, String deadline,
			String path, int file_size) {
		super();
		this.post_num = post_num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.deadline = deadline;
		this.path = path;
		this.file_size = file_size;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
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
	
	
	
}
