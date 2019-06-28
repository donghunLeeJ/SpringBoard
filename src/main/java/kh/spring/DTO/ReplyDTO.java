package kh.spring.DTO;

public class ReplyDTO {
	private int reply_seq;
	private int shop_seq;
	private String writer;
	private String contents;
	public ReplyDTO() {
		super();
	}
	public ReplyDTO(int reply_seq, int shop_seq, String writer, String contents) {
		super();
		this.reply_seq = reply_seq;
		this.shop_seq = shop_seq;
		this.writer = writer;
		this.contents = contents;
	}
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public int getShop_seq() {
		return shop_seq;
	}
	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
