package comment;

public class CommentDTO {
	private int comment_num;
	private int post_num;
	private String comment_writer;
	private String comment_write_date;
	private String comment_content;
	public CommentDTO() {

	}
	public CommentDTO(int comment_num, int post_num, String comment_writer, String comment_write_date,
			String comment_content) {
		super();
		this.comment_num = comment_num;
		this.post_num = post_num;
		this.comment_writer = comment_writer;
		this.comment_write_date = comment_write_date;
		this.comment_content = comment_content;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getComment_writer() {
		return comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}
	public String getComment_write_date() {
		return comment_write_date;
	}
	public void setComment_write_date(String comment_write_date) {
		this.comment_write_date = comment_write_date;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	
	
	
}
