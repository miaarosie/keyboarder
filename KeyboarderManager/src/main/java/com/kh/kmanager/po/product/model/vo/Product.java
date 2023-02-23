package com.kh.kmanager.po.product.model.vo;




import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor 
@Setter	//setter
@Getter //getter
@ToString //toString
public class Product {

	private int productNo;
	private String productName;
	private int price;
	private String description;
	private String attachment1;
	private String attachment2;
	private String attachment3;
	private String attachment4;
	private int sellerNo;
	private int couponNo;
	private String couponName;
	private int productStatus;
	private int soldOut;
	private int onSale;
	

}
