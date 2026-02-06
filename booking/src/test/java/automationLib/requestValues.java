package automationLib;


public class RequestValues {
	private int roomid;
    private String firstname;
    private String lastname;
    private boolean depositpaid;
    private String email;
    private String phone;
    private String token;
	private String endPoint;
	private int bookingId;
	private String checkin;
    private String checkout;

    public int getRoomid() { return roomid; }    
    public void setRoomid(int roomid) { this.roomid = roomid; }

    public String getFirstname() { return firstname; }
    public void setFirstname(String firstname) { this.firstname = firstname; }

    public String getLastname() { return lastname; }
    public void setLastname(String lastname) { this.lastname = lastname; }

    public boolean isDepositpaid() { return depositpaid; }
    public void setDepositpaid(boolean depositpaid) { this.depositpaid = depositpaid; }   

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
	public  void setEndPoint(String endpoint) {
		endPoint = endpoint;
	}
	
	public String getEndPoint() {
		return endPoint;
	}
	
	public void setToken(String tokenvalue) {
		token = tokenvalue;
	}
	
	public String getToken() {
		return token;
	}
	
	public void setBookingId(int bookingid) {
		bookingId = bookingid;
	}
	
	public int getBookingId() {
		return bookingId;
	}

    public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
}
