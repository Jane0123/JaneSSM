package test;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.FlowDao;
import dao.LeavedDao;
import entity.Flow;
import entity.Leaved;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;


import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;



import org.springframework.web.servlet.ModelAndView;
import org.testng.annotations.Test;


import javax.annotation.PostConstruct;

import javax.validation.Valid;
import java.io.IOException;


import java.text.SimpleDateFormat;
import java.util.*;

@Component
@Controller

public class TestController {



    @InitBinder
    public  void binder(WebDataBinder dataBinder){
        dataBinder.registerCustomEditor(Date.class,new CustomDateEditor
                (new SimpleDateFormat("yyyy-MM-dd"),true));
    }


    @Autowired
    private FlowDao flowDao;
    @Autowired
    private LeavedDao leavelDao;


    @GetMapping("/select")
    public ModelAndView hello(){
        ModelAndView modelAndView = new ModelAndView("select");
        List<Leaved> list=leavelDao.queryAll();
          SimpleDateFormat formatter=new SimpleDateFormat(" '时间：' yyyy-MM-dd  E HH:mm:ss ");
            Date date=new Date(System.currentTimeMillis());
            System.out.println("Hello~  * 成功进入  "+formatter.format(date));
            System.out.println(list);
        modelAndView.addObject("Jane",list);
        return modelAndView;

    }

    @GetMapping("/update")
    public ModelAndView update(Integer leaveid){
        ModelAndView modelAndView = new ModelAndView("select");
        leavelDao.updateById(leaveid);
        List<Leaved> list = leavelDao.queryAll();
        modelAndView.addObject("Jane",list);
        return modelAndView;

    }
    @GetMapping("/delete")
    public ModelAndView delete(Integer leaveid){
        ModelAndView modelAndView = new ModelAndView("select");
        leavelDao.deleteById(leaveid);
        List<Leaved> list = leavelDao.queryAll();
        modelAndView.addObject("Jane",list);
        return modelAndView;

    }
    @GetMapping("/queryID")

    public ModelAndView showId(int leaveid){
Leaved leaved=leavelDao.queryById(leaveid);
        ModelAndView modelAndView=new ModelAndView("input");
        modelAndView.addObject("Jane",leaved);
        return modelAndView;
    }

    @GetMapping("/insert")
    public ModelAndView insert(Leaved leavel){
        ModelAndView modelAndView = new ModelAndView("select");
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Leaved leavel1 = new Leaved(leavel.getFid(),leavel.getEmpname(),sdf.format(date),leavel.getReason(),leavel.getStartdate(),leavel.getEnddate(),leavel.getDays(),"N");
        int count = leavelDao.insert(leavel1);
        System.out.println("你已添加"+count+"条数据！");
        List<Leaved> list = leavelDao.queryAll();
        modelAndView.addObject("Jane",list);
        return modelAndView;

    }
    @GetMapping("/query")
    public ModelAndView queryAllBynameAnddate(String empname,String createdate,String status){
        ModelAndView modelAndView = new ModelAndView("select");
        System.out.println(empname + createdate +status);
        List<Leaved> list = leavelDao.queryAllBynameAnddate(empname,createdate,status);

        modelAndView.addObject("Jane",list);
        return modelAndView;

    }
    //拦截器
    @PostConstruct
    @Test
    public void page(){
//        pageNum查询几页数据；pageSize每夜几行数据
        PageHelper.startPage(2,3);
        List<Flow> flows= flowDao.queryAll(null);
        //测试PageInfo全部属性
//PageInfo包含了非常全面的分页属性
        PageInfo pageInfo=new PageInfo(flows);
        System.out.println(pageInfo);
        System.out.println("pageInfo.isHasPreviousPage()："+pageInfo.isHasPreviousPage());
        System.out.println("pageInfo.isHasNextPage():"+pageInfo.isHasNextPage());
        System.out.println("pageInfo.getStartRow():"+pageInfo.getStartRow());
        System.out.println("pageInfo.getEndRow():"+pageInfo.getEndRow());
        System.out.println("pageInfo.isIsFirstPage():"+pageInfo.isIsFirstPage());
        System.out.println("pageInfo.isIsLastPage():"+pageInfo.isIsLastPage());
        System.out.println("查询共有"+ pageInfo.getTotal()+"条数据");
        System.out.println("查询到"+ pageInfo.getPageNum()+"页数据");
        System.out.println( "每页数据有"+pageInfo.getPageSize()+"行");
        Flow flow=new Flow();
        System.out.println("查询到这页的的第一个fid:"+ flow.setFid(pageInfo.getStartRow()));
        ArrayList arrayList=new ArrayList(flows);
        System.out.println(arrayList);
        for(Flow flow1:flows){
            System.out.println("foreach--one ==="+flow1);
        }

    }
@PostConstruct
    @Test
    public void t(){
        String before = "2000-6-1";
        Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String now = sdf.format(date);
        try {
            Date d1 = sdf.parse(before);
            Date d2 = sdf.parse(now);
            long daysBetween = (d2.getTime() - d1.getTime() + 1000000)
                    / (3600 * 24 * 1000);
            System.out.println("从出生到现在相隔："+daysBetween+"天");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    @RequestMapping(value = "/testPost", produces = "application/json;charset=utf-8")
    public ModelAndView testPost(@Valid Flow flow, BindingResult bindingResult)throws IOException {
        ModelAndView mav=new ModelAndView("flow");
        System.out.println(flow);
        return  mav;
    }


}

