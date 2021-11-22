package entity;


import javax.validation.constraints.NotNull;

public class Flow {
    private  int fid;
    @NotNull(message="{user.name.notnull}")
    private String name ;
    private   String flowtype;
    public Flow(){

    }



    public int getFid() {
        return fid;
    }

    public int setFid(int fid) {
        this.fid = fid;

        return fid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFlowtype() {
        return flowtype;
    }

    public void setFlowtype(String flowtype) {
        this.flowtype = flowtype;
    }

    @Override
    public String toString() {
        return "Flow{" +
                "fid=" + fid +
                ", name='" + name + '\'' +
                ", flowtype='" + flowtype + '\'' +
                '}';
    }
    public void sayHello(){
        System.out.println("Hello"+" "+fid+name+flowtype);
    }
}

