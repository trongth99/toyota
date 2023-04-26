package fis.com.vn.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class TransactionResponse {
	
	@JsonProperty("txn") 
	public Txn txn; 
	@JsonProperty("order") 
	public Order order;

}
