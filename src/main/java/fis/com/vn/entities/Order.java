package fis.com.vn.entities;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Order {

	@JsonProperty("version")
	private String version;
	
	@JsonProperty("id")
	private String id;
	
	@JsonProperty("amount")
	private String amount;
	
	@JsonProperty("currency")
	private String currency;
	
	@JsonProperty("creation_time")
	private Date creation_time;

}
