package com.my.ERP.Stock.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.Stock.model.vo.Client;
import com.my.ERP.Stock.model.vo.Product;
import com.my.ERP.common.vo.PageInfo;

public interface StockService {

	ArrayList<Product> productList();

	Product showProduct(String pcode);

	int deleteProduct(String pcode);

	int addProduct(Product product);

	ArrayList<Product> addProductList();

	int modifyProduct(HashMap<String, Object> hs);
	
	ArrayList<Client> clientList();
	
	ArrayList<Client> clientList(PageInfo pi);

	Client showClient(String ccode);

	ArrayList<Client> addClientList();

	ArrayList<Product> searchProduct(HashMap<String, String> hs);

	ArrayList<Client> searchClient(HashMap<String, String> hs, PageInfo pi);

	int clientListCount();

	int searchClientListCount(HashMap<String, String> hs);

	



}
