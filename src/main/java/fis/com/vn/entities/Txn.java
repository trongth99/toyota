package fis.com.vn.entities;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Txn {

	@JsonProperty("id")
	private String id;
	
	@JsonProperty("payment_method")
	private String payment_method;
	
	@JsonProperty("brand_card")
	private String brand_card;
	
	@JsonProperty("issuer_place")
	private String issuer_place;
	
	@JsonProperty("result")
	private String result;
	
	@JsonProperty("result_code")
	private String result_code;
	
	@JsonProperty("message")
	private String message;
	
	@JsonProperty("transaction_time")
	private Date transaction_time;

}
