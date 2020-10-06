package com.my.ERP.Stock.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.Stock.model.vo.Product;
import com.my.ERP.Stock.model.vo.Supply;
import com.my.ERP.common.vo.PageInfo;

public interface StockService {

	ArrayList<Product> productList();

	ArrayList<Client> clientList();

	Product showProduct(String pcode);

	int deleteProduct(String pcode);

	int addProduct(Product product);

	int modifyProduct(HashMap<String, Object> hs);

	Client showClient(String ccode);

	ArrayList<Product> addProductList();

	ArrayList<Client> addClientList();

	ArrayList<Product> searchProduct(HashMap<String, String> hs);

	ArrayList<Supply> supplyManager(PageInfo pi);

	int supplyManagerCount();

	int searchSupplyCount(HashMap<String, Object> hs);

	ArrayList<Supply> searchSupply(HashMap<String, Object> hs, PageInfo pi);

	int productListCount();

	ArrayList<Product> productList(PageInfo pi);

	Supply showSupply(String scode);

	int addSupply(Supply supply);

	int modifySupply(Supply supply);

	int deleteSupply(String del_scode);


	



}
