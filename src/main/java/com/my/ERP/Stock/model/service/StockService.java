package com.my.ERP.Stock.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.Stock.model.vo.Client;
import com.my.ERP.Stock.model.vo.Product;

public interface StockService {

	ArrayList<Product> productList();

	Product showProduct(String pcode);

	int deleteProduct(String pcode);

	int addProduct(Product product);

	ArrayList<Product> addProductList();

	int modifyProduct(HashMap<String, Object> hs);

	ArrayList<Client> clientList();

	Client showClient(String ccode);

	ArrayList<Client> addClientList();

	ArrayList<Product> searchProduct(HashMap<String, String> hs);



}
