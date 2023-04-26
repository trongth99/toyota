package fis.com.vn.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class PayLoadLoi {

	@JsonProperty("error")
	Error error;
}
