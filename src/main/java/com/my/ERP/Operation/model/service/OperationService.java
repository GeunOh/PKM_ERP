package com.my.ERP.Operation.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.my.ERP.Operation.model.vo.Client;
import com.my.ERP.common.vo.PageInfo;

public interface OperationService {

	int clientListCount();

	ArrayList<Client> clientList(PageInfo pi);

	int searchClientListCount(HashMap<String, String> hs);

	ArrayList<Client> searchClient(HashMap<String, String> hs, PageInfo pi);

	int addClient(Client client);

	int deleteClient(String ccode);

	Client showClient(String ccode);

	int modifyClient(HashMap<String, String> hs);

}
