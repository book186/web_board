package pty.std.bbs.sample.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pty.std.bbs.sample.service.SampleService;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="sampleService")
	private SampleService sampleService;

	@RequestMapping(value="/sample/openSampleBoardList.do")
	public ModelAndView openSampleList(Map<String, Object> commandMap) {
		ModelAndView mv = new ModelAndView("/sample/boardList");

		List<Map<String, Object>> list;
		try {
			list = sampleService.selectBoardList(commandMap);
			mv.addObject("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}
}
