package com.jk.controller;

import com.jk.pojo.Tree;
import com.jk.service.TreeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("tree")
public class TreeController {

    @Resource
    private TreeService treeService;

    @RequestMapping(value="getUserTreeData")
    @ResponseBody
    public List<Tree> getUserTreeData(Tree tree){
        List<Tree> list = null;
        if (tree.getId()==null){
             list = treeService.getUserTreeData(0);
        }
        return list;
    }

    @RequestMapping(value="getPowerTreeData")
    @ResponseBody
    public List<Tree> getPowerTreeData(Tree tree){
        List<Tree> list = null;
        if (tree.getId()==null){
             list = treeService.getUserTreeData(-1);
        }
        return list;
    }

    @RequestMapping(value="getSysTreeData")
    @ResponseBody
    public List<Tree> getSysTreeData(Tree tree){
        List<Tree> list = null;
        if (tree.getId()==null){
             list = treeService.getUserTreeData(-2);
        }
        return list;
    }


}
