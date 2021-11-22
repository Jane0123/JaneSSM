package test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.FlowDao;
import entity.Flow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Component("a")
@Scope("prototype")
@Controller
public class FlowController {

    @RequestMapping("/queryAll")
    public PageInfo<Flow>queryAll(@RequestParam(required = true,defaultValue = "1")Integer page, Model model){
        System.out.println("Hello~  * 成功进入 123 ");
        int pageSize=2;
        PageHelper.startPage(page,pageSize);
        List<Flow> flowlist =flowDao .queryAll(null);

        PageInfo<Flow> p=new PageInfo<Flow>(flowlist);
        return p;
    }

    @Autowired
    private FlowDao flowDao;
}
