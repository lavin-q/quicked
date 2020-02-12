package com.quickd.core.util;


import org.apache.commons.codec.binary.Base64;



public class Base64Util {


	/**
	 * 对String类型的数据进行base64加密
	 *
	 */
	public static String encode(String strData) throws Exception {
		byte[] encodeBase64 = Base64.encodeBase64(strData.getBytes("UTF-8"));
		return new String(encodeBase64,"UTF-8");

	}

	public static String encodeNTimes(String strData, int times) throws Exception {
		String tmp = strData;
		for(int i =0;i<times;i++){
			tmp = encode(tmp);
		}
		return tmp;
	}

	public static String decode(String strData) throws Exception {
		byte[] decodeBase64 = Base64.decodeBase64(strData.getBytes("UTF-8"));
		String base64decoded=new String(decodeBase64,"UTF-8");
		return base64decoded;

	}

	public static String decodeNTimes(String strData,int times) throws Exception {
		String tmp = strData;
		for(int i =0;i<times;i++){
			tmp = decode(tmp);
		}
		return tmp;
	}

	public static void main(String args[]) throws Exception {

		String str1="admin" ;

		System.out.println(encodeNTimes(str1,3));

		String str2="V1ZkU2RHRlhORDA9" ;

		System.out.println(decodeNTimes(str2,3));

	}


}
