package com.my.ERP.Stock.model.service;

import java.util.ArrayList;

import com.my.ERP.Stock.model.vo.Product;

public interface StockService {

	ArrayList<Product> productList();

	Product showProduct(String pcode);

	int deleteProduct(String pcode);

	int addProduct(Product product);


}
