package com.yeonoo.stock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.stock.domain.Stock;
import com.yeonoo.stock.service.StockByItemService;

@Controller
public class StockByItemController {
	
	@Autowired
	private StockByItemService stockByItemService;
	
	//페이지로 이동
	@RequestMapping("/stockByItem")
	public String StockByItem() {
		
		return "stock/stockByItemMain";
	}

	//그리드 조회
	@ResponseBody
	@GetMapping("/stockByItem/search")
	public List<Stock> stockByItemSearch() {
		List<Stock> result = stockByItemService.stockByItemSearch();
		return result;
	}

	//검색어조회
	@ResponseBody
	@RequestMapping(value="/stockByItem/searchKeyword", method=RequestMethod.POST)
	public List<Stock> stockByItemSearchByKeyword(Stock stock) {
		List<Stock> result = stockByItemService.stockByItemSearchByKeyword(stock);
		return result;
	}

	//그리드 수정
	@ResponseBody
	@RequestMapping(value="/stockByItem/update", method=RequestMethod.POST)
	public void stockByItemUpdate(@RequestBody Stock stock) {
		stockByItemService.stockByItemUpdate(stock);
	}
	




}
