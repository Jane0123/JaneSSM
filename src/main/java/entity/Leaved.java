package entity;



public class Leaved {


    private Integer leaveid;

    private Integer fid;

    private String empname;

    private String createdate;

    private String reason;

    private String startdate;

    private String enddate;

    private Integer days;

    private String status;
    private Flow flow;

    public Leaved() {

    }
    public Leaved(Integer fid, String empname, String createdate, String reason, String startdate, String enddate, Integer days, String status) {
        this.fid = fid;
        this.empname = empname;
        this.createdate = createdate;
        this.reason = reason;
        this.startdate = startdate;
        this.enddate = enddate;
        this.days = days;
        this.status = status;
    }

    public Flow getFlow() {
        return flow;
    }

    public void setFlow(Flow flow) {
        this.flow = flow;
    }

    public Integer getLeaveid() {
        return leaveid;
    }

    public void setLeaveid(Integer leaveid) {
        this.leaveid = leaveid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Leavel{" +
                "leaveid=" + leaveid +
                ", fid=" + fid +
                ", empname='" + empname + '\'' +
                ", createdate=" + createdate +
                ", reason='" + reason + '\'' +
                ", startdate=" + startdate +
                ", enddate=" + enddate +
                ", days=" + days +
                ", status='" + status + '\'' +
                '}';
    }
}
