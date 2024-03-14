package com.rohini.service;

import java.io.InputStream;
import java.util.List;

import com.rohini.beans.ProductBean;
import com.rohini.beans.ProductCreationBean;

public interface ProductService {

	public String addProduct(String prodName, int prodType, String prodInfo, double prodPrice, int prodQuantity,
			InputStream prodImage);

	public String addProduct(ProductCreationBean product);

	public String removeProduct(String prodId);

	public String updateProduct(ProductCreationBean prevProduct, ProductCreationBean updatedProduct);

	public String updateProductPrice(String prodId, double updatedPrice);

	public List<ProductBean> getAllProducts();

	public List<ProductBean> getAllProductsByType(int type);
	public List<ProductBean> getAllProductsByTypeLimitFour(int type);
	

	public List<ProductBean> searchAllProducts(String search);

	public byte[] getImage(String prodId);

	public ProductBean getProductDetails(String prodId);

	public String updateProductWithoutImage(String prevProductId, ProductCreationBean updatedProduct);

	public double getProductPrice(String prodId);

	public boolean sellNProduct(String prodId, int n);

	public int getProductQuantity(String prodId);
}
