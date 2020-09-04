package com.my.ERP.common;

import com.my.ERP.common.vo.PageInfo;

// 페이징 계산 클래스
public class Pagenation {
	
	// 계산 메서드 PageInfo 객체 반환
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		
		int pageLimit = 10;		// 페이징 갯수
		int maxPage;			// 끝 페이지 번호
		int startPage;			// 페이징의 첫 번째 페이지
		int endPage;			// 페이징의 마지막 페이지
		int boardLimit = 10;     // 한 페이지에 10개씩 보여주겠다.
		
		maxPage = (int)((double)listCount / boardLimit + 0.9); // 120개/10+0.9 : 12 페이지
		startPage = ((int)((double)currentPage / pageLimit + 0.9) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		
		return pi;
		
	}
	
	//근태관리 페이징
	public static PageInfo getWorkPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		
		int pageLimit = 10;		// 페이징 갯수
		int maxPage;			// 끝 페이지 번호
		int startPage;			// 페이징의 첫 번째 페이지
		int endPage;			// 페이징의 마지막 페이지
		int boardLimit = 150;   // 한 페이지에 150개씩 보여주겠다.
		
		maxPage = (int)((double)listCount / boardLimit + 0.9); // 120개/10+0.9 : 12 페이지
		startPage = ((int)((double)currentPage / pageLimit + 0.9) - 1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		
		return pi;
		
	}
}
