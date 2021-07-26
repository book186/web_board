package pty.std.bbs.sample.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface SampleService {
	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

	/*
	 * 전자정부프레임워크 페이지네이션
	 */
	Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception;

	/*
	 * jQuery & Ajax 페이지네이션
	 */
	//List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

}
