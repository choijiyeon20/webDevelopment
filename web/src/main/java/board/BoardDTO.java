package board;

public class BoardDTO {
	private int post_num;
	private String writer;
	private String title;
	private String content;
	private String write_date;
	
	public BoardDTO() {
		
	}
	public BoardDTO(int post_num, String writer, String title, String content, String write_date) {
		super();
		this.post_num = post_num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
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

	
	
}
