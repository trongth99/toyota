package fis.com.vn.entities;



import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;



@Data
public class PaymentResponse {
	@JsonProperty("payment_url")
	public String paymentUrl;
	
	}

	



